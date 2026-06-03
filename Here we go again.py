import customtkinter as ctk
import pymysql
from tkinter import messagebox, filedialog
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.backends.backend_pdf import PdfPages
from PIL import Image
from collections import defaultdict
import os
data = defaultdict(dict)
subjects = []
class database:
    def __init__(self):
        self.con = pymysql.connect(
            host='localhost',
            user='root',
            passwd='Root@123',
            database='school_management_app',
        )
        self.cur=self.con.cursor()
    def ver_log(self, user_id, password):
        self.cur.execute(
            "SELECT * FROM user_details WHERE user_id = %s AND password = %s",
            (user_id, password)
        )
        result = self.cur.fetchone()
        if result is None:
            return None
        # returns ("student",) or ("teacher",) or None  
        self.cur.execute("SELECT grade from student_details where user_id=%s",(user_id,))
        resul=self.cur.fetchone() 
        return result,resul
    def create_user(self, user_id, password, role):
        self.cur.execute(
            "INSERT INTO user_details (user_id, password, role) VALUES (%s, %s, %s)",
            (user_id, password, role)
        )
        self.con.commit()
    def change_password(self, user_id, new_password):
        self.cur.execute(
            "UPDATE user_details SET password = %s WHERE user_id = %s",
            (new_password, user_id)
        )
        self.con.commit()
    def delete_user(self, user_id):
        self.cur.execute(
            "DELETE FROM user_details WHERE user_id = %s",
            (user_id,)
        )
        self.con.commit()
    def create_student(self, user_id, enrollment_no, name, grade, section, combination_id):
        self.cur.execute(
            """INSERT INTO student_details 
            (user_id, enrollment_no, name, grade, section, combination_id)
            VALUES (%s, %s, %s, %s, %s, %s)""",
            (user_id, enrollment_no, name, grade, section, combination_id)
        )
        self.con.commit()
    def create_teacher(self, user_id, employee_code, name, grade, subject_id):
        self.cur.execute(
            """INSERT INTO teacher_details 
            (user_id, employee_code, name, grade, subject_id)
            VALUES (%s, %s, %s, %s, %s)""",
            (user_id, employee_code, name, grade, subject_id)
        )
        self.con.commit()
    def get_student_details(self, user_id):
        self.cur.execute(
            "SELECT * FROM student_details WHERE user_id = %s",
            (user_id,)
        )
        return self.cur.fetchone()
    def get_announcements(self,grade):
        self.cur.execute(
            "SELECT * FROM announcements WHERE target_grade LIKE %s OR target_grade = 'all'",
            (f'%{grade}%',)
        )
        announce_result= self.cur.fetchall()
        return announce_result
    def new_announcements(self,titl,cont,ta_gra):
        self.cur.execute("INSERT INTO announcements (title, content, target_grade) VALUES (%s, %s, %s)", (titl, cont, ta_gra))#insertion
        self.con.commit()#con is needed/the connector
        messagebox.showinfo("Process","The announcement has been posted")
    def report_card_details(self,user_id):
        self.cur.execute("""
    SELECT s.subject_name, m.marks_obtained, m.term 
    FROM marks m
    JOIN subjects s ON m.subject_id = s.subject_id
    WHERE m.user_id = %s
    ORDER BY m.term, s.subject_name
""", (user_id,))#s. and m. are table aliases /shorthand so we don't have to retype the table name every time, also this approach was used for a better presentable output the simpler query gives a hvery very lenghty output
        announce_card=self.cur.fetchall()
        for sub_name, marks, term in announce_card:
            data[term][sub_name] = marks
            if sub_name not in subjects:
                subjects.append(sub_name)
        return announce_card
    def insert_mark(self, user_id, subject_id, term, marks_obtained, max_marks, grade):
        self.cur.execute(
            """INSERT INTO marks (user_id, subject_id, term, marks_obtained, max_marks, grade)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE marks_obtained = %s""",
            (user_id, subject_id, term, marks_obtained, max_marks, grade, marks_obtained)
        )
        self.con.commit()
    def get_subjects_by_combination(self, combination_id):
        self.cur.execute(
            """SELECT s.subject_id, s.subject_name 
            FROM subjects s
            JOIN subject_combinations sc ON s.subject_id = sc.subject_id
            WHERE sc.combination_id = %s""",
            (combination_id,)
        )
        return self.cur.fetchall()
    def get_grades(self): # the functions below are made to assist with dropdowns
        self.cur.execute(
            "SELECT DISTINCT grade FROM student_details ORDER BY grade"
        )
        return [row[0] for row in self.cur.fetchall()]
    def get_sections_by_grade(self, grade):
        self.cur.execute(
            "SELECT DISTINCT section FROM student_details WHERE grade = %s ORDER BY section",
            (grade,)
        )
        return [row[0] for row in self.cur.fetchall()]
    def get_students_by_grade_section(self, grade, section):
        self.cur.execute(
            """SELECT user_id, name FROM student_details 
            WHERE grade = %s AND section = %s ORDER BY name""",
            (grade, section)
        )
        return self.cur.fetchall()  # returns [(user_id, name), ...]
    def get_teacher_grades(self, user_id):
        self.cur.execute(
            "SELECT grade FROM teacher_details WHERE user_id = %s",
            (user_id,)
        )
        result = self.cur.fetchone()[0]  # gives 'IX,X'
        return result.split(',')        # gives ['IX', 'X']
    def get_report_card(self, user_id):
        self.cur.execute("""
            SELECT s.subject_name, m.marks_obtained, m.term
            FROM marks m
            JOIN subjects s ON m.subject_id = s.subject_id
            WHERE m.user_id = %s
            ORDER BY m.term, s.subject_name
        """, (user_id,))
        return self.cur.fetchall()
    def get_subject_id_map(self):
        self.cur.execute("SELECT subject_name, subject_id FROM subjects")
        return {name: sid for name, sid in self.cur.fetchall()}

    def get_student_grade(self, user_id):
        self.cur.execute(
            "SELECT grade FROM student_details WHERE user_id = %s",
            (user_id,)
        )
        return self.cur.fetchone()[0]
    def transport_details(self,user_id):
        self.cur.execute("""
        SELECT td.mode, br.route_name, br.driver_name, 
               br.driver_contact, br.vehicle_number,
               td.guardian_name, td.guardian_contact
        FROM transport_details td
        LEFT JOIN bus_routes br ON td.route_id = br.route_id
        WHERE td.user_id = %s
    """, (user_id,))
        return self.cur.fetchone()
    def get_all_transport(self):
        self.cur.execute(
            """SELECT sd.name, sd.grade, td.mode, 
                    br.route_name, br.driver_name, br.driver_contact,
                    td.guardian_name, td.guardian_contact
            FROM transport_details td
            JOIN student_details sd ON td.user_id = sd.user_id
            LEFT JOIN bus_routes br ON td.route_id = br.route_id
            ORDER BY td.mode, br.route_name, sd.name"""
        )
        return self.cur.fetchall()
    def add_b_route(self, route_name, driver_name, driver_contact, vehicle_number):
        self.cur.execute(
            """INSERT INTO bus_routes (route_name, driver_name, driver_contact, vehicle_number)
            VALUES (%s, %s, %s, %s)""",
            (route_name, driver_name, driver_contact, vehicle_number)
        )
        self.con.commit()
    def update_stud_transp(self, user_id, mode, route_id=None, guardian_name=None, guardian_contact=None):
        self.cur.execute(
            """UPDATE transport_details 
            SET mode = %s, route_id = %s, 
                guardian_name = %s, guardian_contact = %s
            WHERE user_id = %s""",
            (mode, route_id, guardian_name, guardian_contact, user_id)
        )
        self.con.commit()
    def fees_details(self,user_id):
        self.cur.execute("""
        SELECT f.term1_fee, f.term2_fee,
               f.term1_status, f.term2_status,
               f.term1_paid_date, f.term2_paid_date
        FROM fees f
        WHERE f.user_id = %s
    """, (user_id,))
        return self.cur.fetchone()
    def get_newsletters(self):
        self.cur.execute("""
            SELECT newsletter_id, month, title, published_date, file_path
            FROM newsletter
            ORDER BY published_date DESC
        """)
        news_result=self.cur.fetchall()
        return news_result
    def add_newsletter(self, month, title, file_path, published_date):
        self.cur.execute(
            """INSERT INTO newsletter (month, title, file_path, published_date)
            VALUES (%s, %s, %s, %s)""",
            (month, title, file_path, published_date)
        )
        self.con.commit()
    def canteen(self, day):
        self.cur.execute("""
            SELECT cd.meal, cm.item_name, cm.price
            FROM canteen_daily cd
            JOIN canteen_menu cm ON cd.item_id = cm.item_id
            WHERE cd.day = %s
            ORDER BY cd.meal
        """, (day,))
        return self.cur.fetchall()
    def get_all_menu_items(self):
        self.cur.execute("""
            SELECT item_id, item_name, price, category 
            FROM canteen_menu 
            ORDER BY category, item_name
        """)
        return self.cur.fetchall()

    def add_menu_item(self, item_name, price, category):
        self.cur.execute("""
            INSERT INTO canteen_menu (item_name, price, category)
            VALUES (%s, %s, %s)
        """, (item_name, price, category))
        self.con.commit()
        messagebox.showinfo("Success", "Item added successfully")

    def update_item_price(self, item_id, new_price):
        self.cur.execute("""
            UPDATE canteen_menu SET price = %s 
            WHERE item_id = %s
        """, (new_price, item_id))
        self.con.commit()
        messagebox.showinfo("Success", "Price updated successfully")

    def delete_menu_item(self, item_id):
        self.cur.execute(
            "DELETE FROM canteen_menu WHERE item_id = %s",
            (item_id,)
        )
        self.con.commit()
        messagebox.showinfo("Success", "Item removed successfully")
    def get_subject_name(self, subject_id):
        self.cur.execute(
            "SELECT subject_name FROM subjects WHERE subject_id = %s",
            (subject_id,)
        )
        return self.cur.fetchone()[0]
    def get_subjects_for_grade(self, grade):
        # grades 11 and 12 have multiple combinations so get all unique subjects
        # grades 1-10 all have combination 1
        if grade in ('XI', 'XII'):
            self.cur.execute("""
                SELECT DISTINCT s.subject_id, s.subject_name 
                FROM subjects s
                JOIN subject_combinations sc ON s.subject_id = sc.subject_id
                WHERE sc.combination_id IN (2,3,4,5)
                ORDER BY s.subject_name
            """)
        else:
            self.cur.execute("""
                SELECT s.subject_id, s.subject_name 
                FROM subjects s
                JOIN subject_combinations sc ON s.subject_id = sc.subject_id
                WHERE sc.combination_id = 1
                ORDER BY s.subject_name
            """)
        return self.cur.fetchall()
    def get_hw(self, grade):
        self.cur.execute("""
            SELECT h.title, s.subject_name, h.content, h.posted_date
            FROM homework h
            JOIN subjects s ON h.subject_id = s.subject_id
            WHERE h.grade = %s
            ORDER BY h.posted_date DESC
        """, (grade,))
        return self.cur.fetchall()
    def post_hw(self, subject_id, title, content, grade):
        self.cur.execute("""
            INSERT INTO homework (subject_id, title, content, grade)
            VALUES (%s, %s, %s, %s)
        """, (subject_id, title, content, grade))
        self.con.commit()
        messagebox.showinfo("Success", "Homework posted successfully")
    def get_teacher_subject(self, user_id):
        self.cur.execute(
            "SELECT subject_id FROM teacher_details WHERE user_id = %s",
            (user_id,)
        )
        result = self.cur.fetchone()
        return result[0] if result else None
#session exists so that we know the user and their role from the very beginning, so that we don't have to call a query every time we need info
class Session:
    def __init__(self):
        self.user_id = None
        self.role = None
        self.grade = None
        self.grades = None  # list for teachers ['IX','X']
        self.subject_id = None
    def login(self, user_id, role, grade, grades=None, subject_id=None):
        self.user_id = user_id
        self.role = role
        self.grade = grade
        self.grades = grades
        self.subject_id = subject_id
    def logout(self):
        self.user_id = None
        self.role = None
        self.grade = None
        self.grades = None
    def is_logged_in(self):
        return self.user_id is not None
class login:
    def __init__(self, root, db, session):
        self.db = db
        self.session = session
        self.root=root
        self.root.title("Login")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        imgl=Image.open("E-City-1.png")
        self.ctk_imgl=ctk.CTkImage(light_image=imgl,size=(267,157))
        imgl_label=ctk.CTkLabel(self.inner_ui,image=self.ctk_imgl,text="", corner_radius=25)
        imgl_label.pack()
        username=ctk.CTkLabel(self.inner_ui,text="User ID")
        username.pack()
        self.u_i_e=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter your userid")
        self.u_i_e.pack()
        userpassword=ctk.CTkLabel(self.inner_ui,text="User Password")
        userpassword.pack()
        self.u_p_e=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter your password")
        self.u_p_e.pack()
        log_button=ctk.CTkButton(self.inner_ui,text="Login", command=self.log_process) 
        log_button.pack(pady=10,padx=10)
        self.u_p_e.bind("<Return>", lambda e: self.log_process())
    def log_process(self):
        user_id = self.u_i_e.get().strip()
        password = self.u_p_e.get().strip()
        if not user_id or not password:
            messagebox.showerror("Error", "Please fill in both fields.")
            return
        result = self.db.ver_log(user_id, password)
        if result is None:
            messagebox.showerror("Error", "Invalid credentials.")
            return
        role = result[0][2]
        grade = result[1][0] if result[1] else None
        # get teacher grades list if teacher
        grades = None
        subject_id = None
        if role == 'Teacher':
            grades = self.db.get_teacher_grades(user_id)
            subject_id = self.db.get_teacher_subject(user_id)
        self.session.login(user_id, role, grade, grades, subject_id)
        for widget in self.root.winfo_children():
            widget.destroy()
        mainmenu(self.root, self.db, self.session)
class mainmenu:
    def __init__(self,root,db,session):
        self.root=root
        self.db=db
        self.session=session
        self.root.title("We Better")
        self.root.geometry("380x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        butwid=140
        butheight=100
        font=ctk.CTkFont( size=16, weight="bold")
        if self.session.role=="Student":
            ctk.CTkButton(self.inner_ui, text="Report Card", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(Reportcard)).grid(row=0, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Fees", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(fees)).grid(row=0, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Announcements", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(announcements)).grid(row=1, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="User Details", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(userdetails)).grid(row=1, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Homework", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(homework)).grid(row=2, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Canteen", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(canteen)).grid(row=2, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Transport Details", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(transportdetails)).grid(row=3, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Newsletter", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(Newsletter)).grid(row=3, column=1, padx=10, pady=10)
        if self.session.role=="Teacher":
            ctk.CTkButton(self.inner_ui, text="Report Card", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(adminteach_report)).grid(row=0, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Announcements", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(announcements)).grid(row=1, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="User Details", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(userdetails)).grid(row=1, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Homework", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(adminteach_hw)).grid(row=2, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Canteen", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(canteen)).grid(row=2, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Transport Details", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(transportdetails)).grid(row=3, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Newsletter", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(adminteach_newsletter)).grid(row=0, column=1, padx=10, pady=10)
        if self.session.role=="Admin":
            ctk.CTkButton(self.inner_ui, text="Report Card", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(adminteach_report)).grid(row=0, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Fees", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(admin_fees)).grid(row=0, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Announcements", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(announcements)).grid(row=1, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="User Details", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(userdetails)).grid(row=1, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Homework", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(adminteach_hw)).grid(row=2, column=1, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Canteen", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(admin_canteen)).grid(row=2, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Transport Details", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(admin_transport)).grid(row=3, column=0, padx=10, pady=10)
            ctk.CTkButton(self.inner_ui, text="Newsletter", width=butwid, height=butheight, font=font,command=lambda:self.switcheroo(adminteach_newsletter)).grid(row=3, column=1, padx=10, pady=10)
    def switcheroo(self, xyz): #xyz is holding parameter for the class we will be switching to can be anything provided that thingb is undefined atm.
        for widget in self.root.winfo_children():
            widget.destroy()
        xyz(self.root, self.db, self.session)
class fees:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db#necessary or else no database
        self.root.title("Fees portal")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        ctk.CTkButton(self.inner_ui, text="back", command=self.back_bt).grid(row=0,column=0,columnspan=2)
        q=self.db.get_student_details(self.session.user_id)
        ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=1,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=2,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=3,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=4,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=5,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=1,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
        f = self.db.fees_details(self.session.user_id)
        # TO UNPACK cleanly
        term1_fee, term2_fee, term1_status, term2_status, term1_date, term2_date = f
        # progress bar spreads over both columns
        paid = sum([1 if term1_status == 'Paid' else 0,
                    1 if term2_status == 'Paid' else 0])
        bar = ctk.CTkProgressBar(self.inner_ui, width=300)
        bar.grid(row=6, column=0, columnspan=2, pady=10)
        bar.set(paid / 2)
        ctk.CTkLabel(self.inner_ui, text=f"{paid}/2 terms paid").grid(row=7, column=0, columnspan=2)
        # term cards side by side
        for col, (term, fee, status, date) in enumerate([
            ("Term 1", term1_fee, term1_status, term1_date),
            ("Term 2", term2_fee, term2_status, term2_date)
        ]):
            ctk.CTkLabel(self.inner_ui, text=term, font=("Roboto", 16, "bold")).grid(row=8, column=col, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text=f"₹{fee:,.0f}").grid(row=9, column=col, padx=10)
            ctk.CTkLabel(self.inner_ui, text=f"Status: {status}").grid(row=10, column=col, padx=10)
            if date:
                ctk.CTkLabel(self.inner_ui, text=f"Paid on: {date}").grid(row=11, column=col, padx=10)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class userdetails:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=7,columnspan=2)
        if self.session.role == "Student":
            q=self.db.get_student_details(self.session.user_id)
            imgp=Image.open("Capture1.png")
            self.ctk_img=ctk.CTkImage(light_image=imgp,size=(125,125))
            img_label=ctk.CTkLabel(self.inner_ui,image=self.ctk_img,text="", corner_radius=25)
            img_label.grid(row=0,column=0,pady=10,padx=10,columnspan=2)#columnspan 2 allows us to centre align the image between the two columns
            ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=1,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=2,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=3,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=4,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=5,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[5],font=("Roboto", 18)).grid(row=6,column=1,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=1,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Combination :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
        if self.session.role =="Teacher":
             q=self.db.get_student_details(self.session.user_id)
             imgp=Image.open("Capture1.png")
             self.ctk_img=ctk.CTkImage(light_image=imgp,size=(125,125))
             img_label=ctk.CTkLabel(self.inner_ui,image=self.ctk_img,text="", corner_radius=25)
             img_label.grid(row=0,column=0,pady=10,padx=10,columnspan=2)#columnspan 2 allows us to centre align the image between the two columns
             ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=1,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=2,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=3,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=4,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=5,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text=q[5],font=("Roboto", 18)).grid(row=6,column=1,pady=5,padx=5)
             ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=1,column=0,padx=5,pady=5)
             ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
             ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
             ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
             ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
             ctk.CTkLabel(self.inner_ui,text="Combination :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class Reportcard:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("720x800")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_btn=ctk.CTkButton(self.inner_ui,text="back",command=self.bck_btn).grid(row=0,column=2,columnspan=2)
        if self.session.role == "Student":
            q=self.db.get_student_details(self.session.user_id)
            pa=self.db.report_card_details(self.session.user_id)
            ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=1,column=3,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=2,column=3,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=3,column=3,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=4,column=3,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=5,column=3,pady=5,padx=5)
            ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=1,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=2,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=3,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=4,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=2,padx=5,pady=5)
            # header row
            for col, subject in enumerate(subjects):
                ctk.CTkLabel(self.inner_ui, text=subject).grid(row=6, column=col+1)
            # Term1 row
            ctk.CTkLabel(self.inner_ui, text="Term1").grid(row=7, column=0)
            for col, subject in enumerate(subjects):
                ctk.CTkLabel(self.inner_ui, text=str(data['Term1'][subject])).grid(row=7, column=col+1)
            # Term2 row
            ctk.CTkLabel(self.inner_ui, text="Term2").grid(row=8, column=0)
            for col, subject in enumerate(subjects):
                ctk.CTkLabel(self.inner_ui, text=str(data['Term2'][subject])).grid(row=8, column=col+1)
            ctk.CTkButton(self.inner_ui, text="View Graph",
            command=lambda: self.show_graph(data, subjects)).grid(row=9,column=2,columnspan=2,pady=10)
    def show_graph(self, data, subjects):
        import numpy as np
        term1_marks = [data['Term1'][sub] for sub in subjects]
        term2_marks = [data['Term2'][sub] for sub in subjects]
        x = np.arange(len(subjects))
        width = 0.2
        fig, ax = plt.subplots(figsize=(8, 4))
        bars1 = ax.bar(x - width/2, term1_marks, width, label='Term 1', color='steelblue')
        bars2 = ax.bar(x + width/2, term2_marks, width, label='Term 2', color='coral')
        # labels and formatting
        ax.set_xlabel('Subjects')
        ax.set_ylabel('Marks')
        ax.set_title('Term 1 vs Term 2 Comparison')
        ax.set_xticks(x)
        ax.set_xticklabels(subjects, rotation=15, ha='right')
        ax.set_ylim(0, 110)
        ax.legend()
        # show actual mark values on top of each bar
        for bar in bars1:
            ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1,
                    str(int(bar.get_height())), ha='center', va='bottom', fontsize=9)
        for bar in bars2:
            ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1,
                    str(int(bar.get_height())), ha='center', va='bottom', fontsize=9)
        fig.tight_layout()
        canvas = FigureCanvasTkAgg(fig, master=self.inner_ui)
        canvas.draw()
        canvas.get_tk_widget().grid(row=10, column=0,pady=10,columnspan=6)
    def bck_btn(self):
        for widget in self.root.winfo_children():
            widget.destroy()
        mainmenu(self.root, self.db, self.session)
class announcements:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("720x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=5)
        if self.session.role=="Student":
            grade=self.session.grade #needed for passing the argument
            wow=self.db.get_announcements(grade)#calls the announcement function from database class, grade is the argument required        
            for k, i in enumerate(wow):#need the row placement to happen at the same time or else we end up with the same mannouncement thus this loop
                ctk.CTkLabel(self.inner_ui, text=str(i[0])).grid(row=k+1, column=1)
                ctk.CTkLabel(self.inner_ui, text=str(i[1])).grid(row=k+1, column=2)
                ctk.CTkLabel(self.inner_ui, text=str(i[2])).grid(row=k+1, column=3)
                ctk.CTkLabel(self.inner_ui, text=str(i[3])).grid(row=k+1, column=4)
                ctk.CTkLabel(self.inner_ui, text=str(i[4])).grid(row=k+1, column=0)
        if self.session.role=="Teacher" or "Admin":
           ctk.CTkLabel(self.inner_ui,text="Enter Title").grid(row=1,column=0)
           self.ti = ctk.CTkEntry(self.inner_ui, placeholder_text="Enter title")
           self.ti.grid(row=2, column=0,padx=5,pady=5)
           ctk.CTkLabel(self.inner_ui,text="Enter Content").grid(row=3,column=0)
           self.co = ctk.CTkEntry(self.inner_ui, placeholder_text="Enter Content")
           self.co.grid(row=4, column=0,padx=5,pady=5)
           ctk.CTkLabel(self.inner_ui,text="Enter Grades").grid(row=5,column=0)
           self.ta_gr = ctk.CTkEntry(self.inner_ui, placeholder_text="Enter intended grades")
           self.ta_gr.grid(row=6, column=0,padx=5,pady=5)
           self.ta_gr.bind("<Return>", lambda e: self.new_annoncements())
    def new_annoncements(self):
        titl = self.ti.get()
        cont = self.co.get()
        ta_gra = self.ta_gr.get()
        self.db.new_announcements(titl,cont,ta_gra)
    #needed to fix the attribute not present in announcements
    #so i made two functions, one in databse class to do database thing
    #this one takes the input values and passes them into that function
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)   
class homework: 
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("720x600")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=4)
        grade = self.session.grade
        ghw=self.db.get_hw(grade)
        ctk.CTkLabel(self.inner_ui, text="Subject",font=("Roboto", 18)).grid(row=1,column=0)
        ctk.CTkLabel(self.inner_ui, text="Topic",font=("Roboto", 18)).grid(row=1,column=1)
        ctk.CTkLabel(self.inner_ui, text="Content",font=("Roboto", 18)).grid(row=1,column=2)
        ctk.CTkLabel(self.inner_ui, text="Date",font=("Roboto", 18)).grid(row=1,column=3)
        for k, i in enumerate(ghw):#need the row placement to happen at the same time or else we end up with the same mannouncement thus this loop
            ctk.CTkLabel(self.inner_ui, text=str(i[1])).grid(row=k+2, column=0, padx=5)#k+2 cause had to put back button and the titles above too so k+2
            ctk.CTkLabel(self.inner_ui, text=str(i[0])).grid(row=k+2, column=1, padx=5)
            ctk.CTkLabel(self.inner_ui, text=str(i[2])).grid(row=k+2, column=2, padx=5)
            ctk.CTkLabel(self.inner_ui, text=str(i[3])).grid(row=k+2, column=3, padx=5)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)  
class canteen:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
        self.day_var = ctk.StringVar(value='Monday')
        self.day_drop = ctk.CTkOptionMenu(
            self.inner_ui,
            values=days,
            variable=self.day_var,
            command=self.load_menu
        ).grid(row=0, column=0, columnspan=3, padx=10, pady=10)
        self.load_menu('Monday')  # load monday by default
    def load_menu(self, day):
            # clear previous results first
            for widget in self.inner_ui.grid_slaves():
                if int(widget.grid_info()['row']) > 0:
                    widget.destroy()
            menu_data = self.db.canteen(day)
            for row, (meal, item, price) in enumerate(menu_data):
                ctk.CTkLabel(self.inner_ui, text=meal).grid(row=row+1, column=0, padx=10, pady=5)
                ctk.CTkLabel(self.inner_ui, text=item).grid(row=row+1, column=1, padx=10, pady=5)
                ctk.CTkLabel(self.inner_ui, text=f"₹{float(price):.0f}").grid(row=row+1, column=2, padx=10, pady=5)    
            bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=4,columnspan=3)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session) 
class Newsletter:  
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=7,columnspan=2)
        newsletter=self.db.get_newsletters()
        for row, n in enumerate(newsletter):
            ctk.CTkButton(
                self.inner_ui,
                text=f"{n[1]} — {n[2]}",
                command=lambda path=n[4]: os.startfile(path)
            ).grid(row=row, column=0, padx=10, pady=5)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class transportdetails:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=2)
        q=self.db.get_student_details(self.session.user_id)
        tpd=self.db.transport_details(self.session.user_id)
        ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=1,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=2,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=3,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=4,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=5,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=1,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
        if tpd[0] == "Bus":
            ctk.CTkLabel(self.inner_ui,text="Mode :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Bus route :",font=("Roboto", 18,"bold")).grid(row=7,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Driver Name :",font=("Roboto", 18,"bold")).grid(row=8,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Contact Details :",font=("Roboto", 18,"bold")).grid(row=9,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[0],font=("Roboto", 18,"bold")).grid(row=6,column=1,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[1],font=("Roboto", 18,"bold")).grid(row=7,column=1,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[2],font=("Roboto", 18,"bold")).grid(row=8,column=1,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[3],font=("Roboto", 18,"bold")).grid(row=9,column=1,padx=5,pady=5)
            print(tpd)
        if tpd[0]=="Private":
            ctk.CTkLabel(self.inner_ui,text="Mode :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Guardian :",font=("Roboto", 18,"bold")).grid(row=7,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Contact Details :",font=("Roboto", 18,"bold")).grid(row=8,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[0],font=("Roboto", 18,"bold")).grid(row=6,column=1,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[5],font=("Roboto", 18,"bold")).grid(row=7,column=1,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[6],font=("Roboto", 18,"bold")).grid(row=8,column=1,padx=5,pady=5)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class adminteach_report:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("540x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=3)
        all_grades = self.db.get_grades()
        # admin gets all grades, teacher gets only their grades
        if self.session.role == "Admin":
            grades = self.db.get_grades()
        else:
            grades = self.session.grades
        self.grade_var = ctk.StringVar(value=grades[0])
        ctk.CTkOptionMenu(self.inner_ui,values=grades,variable=self.grade_var,command=self.on_grade_select).grid(row=1, column=0, padx=10, pady=10)
        self.section_var = ctk.StringVar(value="Select Section")
        self.section_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Grade First"],variable=self.section_var, command=self.on_section_select)
        self.section_drop.grid(row=1, column=1, padx=10, pady=10)
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Section First"],variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.on_grade_select(grades[0])
    def on_grade_select(self, grade):
        print(f"Grade selected: {grade}")
        sections = self.db.get_sections_by_grade(grade)
        print(f"Sections found: {sections}")
        self.section_drop.configure(values=sections)
        self.section_var.set("Select Section")
        self.student_drop.configure(values=["Select Section First"])
        self.student_var.set("Select Student")
        self.clear_results()
    def on_section_select(self, section):
        students = self.db.get_students_by_grade_section(self.grade_var.get(), section)
        self.student_map = {name: uid for uid, name in students}
        self.student_drop.destroy()
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=list(self.student_map.keys()),variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.clear_results()
    def on_student_select(self, name):
        print(f"Student selected: {name}")
        user_id = self.student_map[name]
        print(f"User ID: {user_id}")
        self.clear_results()
        self.load_marks(user_id)
    def load_marks(self, user_id):
        from collections import defaultdict
        report_card = self.db.get_report_card(user_id)
        data = defaultdict(dict)
        subjects = []
        for subject_name, marks, term in report_card:
            data[term][subject_name] = marks
            if subject_name not in subjects:
                subjects.append(subject_name)
        ctk.CTkLabel(self.inner_ui, text="Subject", font=("Roboto", 13, "bold")).grid(row=3, column=0, padx=10, pady=5)
        ctk.CTkLabel(self.inner_ui, text="Term 1", font=("Roboto", 13, "bold")).grid(row=3, column=1, padx=10, pady=5)
        ctk.CTkLabel(self.inner_ui, text="Term 2", font=("Roboto", 13, "bold")).grid(row=3, column=2, padx=10, pady=5)
        for i, subject in enumerate(subjects):
            ctk.CTkLabel(self.inner_ui, text=subject).grid(row=i+4, column=0, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text=str(data['Term1'].get(subject, 'N/A'))).grid(row=i+4, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text=str(data['Term2'].get(subject, 'N/A'))).grid(row=i+4, column=2, padx=10, pady=5)
    def clear_results(self):
        for widget in self.inner_ui.grid_slaves():
            if int(widget.grid_info()['row']) >= 3:
                widget.destroy()
    def back_bt(self):
        for widget in self.root.winfo_children():
            widget.destroy()
        mainmenu(self.root, self.db, self.session)
class admin_transport:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("600x600")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=3)
        grades = self.db.get_grades()
        self.grade_var = ctk.StringVar(value=grades[0])
        ctk.CTkOptionMenu(self.inner_ui,values=grades,variable=self.grade_var,command=self.on_grade_select).grid(row=1, column=0, padx=10, pady=10)
        self.section_var = ctk.StringVar(value="Select Section")
        self.section_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Grade First"],variable=self.section_var, command=self.on_section_select)
        self.section_drop.grid(row=1, column=1, padx=10, pady=10)
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Section First"],variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.on_grade_select(grades[0])
    def on_grade_select(self, grade):
        print(f"Grade selected: {grade}")
        sections = self.db.get_sections_by_grade(grade)
        print(f"Sections found: {sections}")
        self.section_drop.configure(values=sections)
        self.section_var.set("Select Section")
        self.student_drop.configure(values=["Select Section First"])
        self.student_var.set("Select Student")
        self.clear_results()
    def on_section_select(self, section):
        students = self.db.get_students_by_grade_section(self.grade_var.get(), section)
        self.student_map = {name: uid for uid, name in students}
        self.student_drop.destroy()
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=list(self.student_map.keys()),variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.clear_results()
    def on_student_select(self, name):
        print(f"Student selected: {name}")
        user_id = self.student_map[name]
        print(f"User ID: {user_id}")
        self.clear_results()
        self.transport_load(user_id)
    def transport_load(self,user_id):
        q=self.db.get_student_details(user_id)# DONT FORGET  WE USED user_id here instead of self.session.user_id cause user_id has been directly passed and we don't need to call session here
        tpd=self.db.transport_details(user_id)
        ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=2,column=2,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=3,column=2,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=4,column=2,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=5,column=2,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=6,column=2,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
        if tpd[0] == "Bus":
            ctk.CTkLabel(self.inner_ui,text="Mode :",font=("Roboto", 18,"bold")).grid(row=7,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Bus route :",font=("Roboto", 18,"bold")).grid(row=8,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui,text="Driver Name :",font=("Roboto", 18,"bold")).grid(row=9,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Contact Details :",font=("Roboto", 18,"bold")).grid(row=10,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[0],font=("Roboto", 18,"bold")).grid(row=7,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[1],font=("Roboto", 18,"bold")).grid(row=8,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[2],font=("Roboto", 18,"bold")).grid(row=9,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[3],font=("Roboto", 18,"bold")).grid(row=10,column=2,padx=5,pady=5)
            print(tpd)
        if tpd[0]=="Private":
            ctk.CTkLabel(self.inner_ui,text="Mode :",font=("Roboto", 18,"bold")).grid(row=7,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Guardian :",font=("Roboto", 18,"bold")).grid(row=8,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text="Contact Details :",font=("Roboto", 18,"bold")).grid(row=9,column=0,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[0],font=("Roboto", 18,"bold")).grid(row=7,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[5],font=("Roboto", 18,"bold")).grid(row=8,column=2,padx=5,pady=5)
            ctk.CTkLabel(self.inner_ui, text=tpd[6],font=("Roboto", 18,"bold")).grid(row=9,column=2,padx=5,pady=5)
    def clear_results(self):
        for widget in self.inner_ui.grid_slaves():
            if int(widget.grid_info()['row']) >= 3:
                widget.destroy()
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class admin_fees:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("540x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=3)
        grades = self.db.get_grades()
        self.grade_var = ctk.StringVar(value=grades[0])
        ctk.CTkOptionMenu(self.inner_ui,values=grades,variable=self.grade_var,command=self.on_grade_select).grid(row=1, column=0, padx=10, pady=10)
        self.section_var = ctk.StringVar(value="Select Section")
        self.section_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Grade First"],variable=self.section_var, command=self.on_section_select)
        self.section_drop.grid(row=1, column=1, padx=10, pady=10)
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Section First"],variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.on_grade_select(grades[0])
    def on_grade_select(self, grade):
        print(f"Grade selected: {grade}")
        sections = self.db.get_sections_by_grade(grade)
        print(f"Sections found: {sections}")
        self.section_drop.configure(values=sections)
        self.section_var.set("Select Section")
        self.student_drop.configure(values=["Select Section First"])
        self.student_var.set("Select Student")
        self.clear_results()
    def on_section_select(self, section):
        students = self.db.get_students_by_grade_section(self.grade_var.get(), section)
        self.student_map = {name: uid for uid, name in students}
        self.student_drop.destroy()
        self.student_var = ctk.StringVar(value="Select Student")
        self.student_drop = ctk.CTkOptionMenu(self.inner_ui,values=list(self.student_map.keys()),variable=self.student_var,command=self.on_student_select)
        self.student_drop.grid(row=1, column=2, padx=10, pady=10)
        self.clear_results()
    def on_student_select(self, name):
        print(f"Student selected: {name}")
        user_id = self.student_map[name]
        print(f"User ID: {user_id}")
        self.clear_results()
        self.fee_load(user_id)
    def fee_load(self,user_id):
        q=self.db.get_student_details(user_id)# we used user_id here not self.session.user_id cause we already have user_id in this instance compared to others
        ctk.CTkLabel(self.inner_ui,text=q[0],font=("Roboto", 18)).grid(row=2,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[1],font=("Roboto", 18)).grid(row=3,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[2],font=("Roboto", 18)).grid(row=4,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[3],font=("Roboto", 18)).grid(row=5,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text=q[4],font=("Roboto", 18)).grid(row=6,column=1,pady=5,padx=5)
        ctk.CTkLabel(self.inner_ui,text="User ID :",font=("Roboto", 18,"bold")).grid(row=2,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Enrollment number :",font=("Roboto", 18,"bold")).grid(row=3,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Name :",font=("Roboto", 18,"bold")).grid(row=4,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Class :",font=("Roboto", 18,"bold")).grid(row=5,column=0,padx=5,pady=5)
        ctk.CTkLabel(self.inner_ui,text="Section :",font=("Roboto", 18,"bold")).grid(row=6,column=0,padx=5,pady=5)
        f = self.db.fees_details(user_id)
        # TO UNPACK cleanly
        term1_fee, term2_fee, term1_status, term2_status, term1_date, term2_date = f
        # progress bar spreads over both columns
        paid = sum([1 if term1_status == 'Paid' else 0,
                    1 if term2_status == 'Paid' else 0])
        bar = ctk.CTkProgressBar(self.inner_ui, width=300)
        bar.grid(row=7, column=0, columnspan=2, pady=10)
        bar.set(paid / 2)
        ctk.CTkLabel(self.inner_ui, text=f"{paid}/2 terms paid").grid(row=8, column=0, columnspan=2)
        # term cards side by side
        for col, (term, fee, status, date) in enumerate([
            ("Term 1", term1_fee, term1_status, term1_date),
            ("Term 2", term2_fee, term2_status, term2_date)
        ]):
            ctk.CTkLabel(self.inner_ui, text=term, font=("Roboto", 16, "bold")).grid(row=9, column=col, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text=f"₹{fee:,.0f}").grid(row=10, column=col, padx=10)
            ctk.CTkLabel(self.inner_ui, text=f"Status: {status}").grid(row=11, column=col, padx=10)
            if date:
                ctk.CTkLabel(self.inner_ui, text=f"Paid on: {date}").grid(row=12, column=col, padx=10)
    def clear_results(self):
        for widget in self.inner_ui.grid_slaves():
            if int(widget.grid_info()['row']) >= 3:
                widget.destroy()
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class adminteach_hw:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=2)
        self.subject_map = {}
        ctk.CTkButton(self.inner_ui, text="Back",command=self.back_bt).grid(row=0, column=0, columnspan=2, pady=10)
        if self.session.role == "Teacher":
            # grade dropdown locked to their grades
            grades = self.session.grades
            ctk.CTkLabel(self.inner_ui, text="Grade").grid(row=1, column=0, padx=10, pady=5)
            self.grade_var = ctk.StringVar(value=grades[0])
            ctk.CTkOptionMenu(self.inner_ui,values=grades,variable=self.grade_var,command=self.on_grade_select_teacher).grid(row=1, column=1, padx=10, pady=5)
            # subject locked to their subject_id — just a label not a dropdown
            subject_name = self.db.get_subject_name(self.session.subject_id)
            ctk.CTkLabel(self.inner_ui, text="Subject").grid(row=2, column=0, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text=subject_name, font=("Roboto", 13, "bold")).grid(row=2, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text="Title").grid(row=3, column=0, padx=10, pady=5)
            self.title_entry = ctk.CTkEntry(self.inner_ui, width=200, placeholder_text="Enter title")
            self.title_entry.grid(row=3, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text="Content").grid(row=4, column=0, padx=10, pady=5)
            self.content_entry = ctk.CTkEntry(self.inner_ui, width=200, placeholder_text="Enter content")
            self.content_entry.grid(row=4, column=1, padx=10, pady=5)
            ctk.CTkButton(
                self.inner_ui, text="Post Homework",
                command=self.post_homework_teacher
            ).grid(row=5, column=0, columnspan=2, pady=10)
        elif self.session.role == "Admin":
            all_grades = ['I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII']
            ctk.CTkLabel(self.inner_ui, text="Grade").grid(row=1, column=0, padx=10, pady=5)
            self.grade_var = ctk.StringVar(value="Select Grade")
            ctk.CTkOptionMenu(
                self.inner_ui,
                values=all_grades,
                variable=self.grade_var,
                command=self.on_grade_select_admin
            ).grid(row=1, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text="Subject").grid(row=2, column=0, padx=10, pady=5)
            self.subject_var = ctk.StringVar(value="Select Grade First")
            self.subject_drop = ctk.CTkOptionMenu(self.inner_ui,values=["Select Grade First"],variable=self.subject_var,command=self.on_subject_select)
            self.subject_drop.grid(row=2, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text="Title").grid(row=3, column=0, padx=10, pady=5)
            self.title_entry = ctk.CTkEntry(self.inner_ui, width=200, placeholder_text="Enter title")
            self.title_entry.grid(row=3, column=1, padx=10, pady=5)
            ctk.CTkLabel(self.inner_ui, text="Content").grid(row=4, column=0, padx=10, pady=5)
            self.content_entry = ctk.CTkEntry(self.inner_ui, width=200, placeholder_text="Enter content")
            self.content_entry.grid(row=4, column=1, padx=10, pady=5)
            ctk.CTkButton(self.inner_ui, text="Post Homework",command=self.post_homework_admin).grid(row=5, column=0, columnspan=2, pady=10)
    def on_grade_select_admin(self, grade):
        subjects = self.db.get_subjects_for_grade(grade)
        self.subject_map = {name: sid for sid, name in subjects}
        self.subject_drop.destroy()
        self.subject_var = ctk.StringVar(value="Select Subject")
        self.subject_drop = ctk.CTkOptionMenu(self.inner_ui,values=list(self.subject_map.keys()),variable=self.subject_var,command=self.on_subject_select)
        self.subject_drop.grid(row=2, column=1, padx=10, pady=5)
    def on_subject_select(self, subject):
        pass  # just needed to register selection
    def on_grade_select_teacher(self, grade):
        pass  # grade just updates the var, subject stays fixed
    def post_homework_teacher(self):
        grade = self.grade_var.get()
        title = self.title_entry.get().strip()
        content = self.content_entry.get().strip()
        if not title or not content:
            messagebox.showerror("Error", "Please fill in all fields")
            return
        self.db.post_hw(self.session.subject_id, title, content, grade)
        self.title_entry.delete(0, 'end')
        self.content_entry.delete(0, 'end')
    def post_homework_admin(self):
        grade = self.grade_var.get()
        subject_name = self.subject_var.get()
        title = self.title_entry.get().strip()
        content = self.content_entry.get().strip()
        if grade == "Select Grade" or subject_name == "Select Grade First" or subject_name == "Select Subject":
            messagebox.showerror("Error", "Please select grade and subject")
            return
        if not title or not content:
            messagebox.showerror("Error", "Please fill in all fields")
            return
        subject_id = self.subject_map[subject_name]
        self.db.post_hw(subject_id, title, content, grade)
        self.title_entry.delete(0, 'end')
        self.content_entry.delete(0, 'end')
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class adminteach_newsletter:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=2)
        ctk.CTkLabel(self.inner_ui, text="Month").grid(row=1,column=0, padx=10,pady=10)
        ctk.CTkLabel(self.inner_ui, text="Title").grid(row=2,column=0, padx=10,pady=10)
        ctk.CTkLabel(self.inner_ui, text="File Path").grid(row=3,column=0, padx=10,pady=10)
        ctk.CTkLabel(self.inner_ui, text="Published Date").grid(row=4,column=0, padx=10,pady=10)
        self.month=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter Month").grid(row=1,column=1,pady=10,padx=10)
        self.title=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter Title").grid(row=2,column=1,pady=10,padx=10)
        self.file_p=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter File path").grid(row=3,column=1,pady=10,padx=10)
        self.date=ctk.CTkEntry(self.inner_ui, placeholder_text="Enter Date").grid(row=4,column=1,pady=10,padx=10)
    def new_newsletter(self):
        title=self.title.get()
        mont=self.month.get()
        filepat=self.file_p.get()
        date=self.date.get()
        self.dp.add_newsletter(mont,title,filepat,date)
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
class admin_canteen:
    def __init__(self,root,db,session):
        self.root=root
        self.session=session
        self.db=db
        self.root.title("We Better")
        self.root.geometry("600x600")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=0,columnspan=5)
        # load manage items by default
        self.show_manage_items()
    def clear_content(self):
        for widget in self.inner_ui.grid_slaves():
            if int(widget.grid_info()['row']) >= 2:
                widget.destroy()
    def show_manage_items(self):
        self.clear_content()
        items = self.db.get_all_menu_items()
        self.item_map = {name: iid for iid, name, price, cat in items}
        # add new item section
        ctk.CTkLabel(self.inner_ui, text="Add New Item",font=("Roboto", 14, "bold")).grid(row=2, column=0, columnspan=5, pady=10)
        ctk.CTkLabel(self.inner_ui, text="Name").grid(row=3, column=0, padx=5, pady=5)
        self.new_name = ctk.CTkEntry(self.inner_ui, width=150, placeholder_text="Item name")
        self.new_name.grid(row=3, column=1, padx=5, pady=5)
        ctk.CTkLabel(self.inner_ui, text="Price").grid(row=3, column=2, padx=5, pady=5)
        self.new_price = ctk.CTkEntry(self.inner_ui, width=100, placeholder_text="Price")
        self.new_price.grid(row=3, column=3, padx=5, pady=5)
        ctk.CTkLabel(self.inner_ui, text="Category").grid(row=4, column=0, padx=5, pady=5)
        self.new_cat = ctk.CTkOptionMenu(self.inner_ui,values=['Breakfast', 'Lunch', 'Snacks', 'Beverages'] )
        self.new_cat.grid(row=4, column=1, padx=5, pady=5)
        ctk.CTkButton(self.inner_ui, text="Add Item",command=self.add_item).grid(row=4, column=2, columnspan=5, padx=5, pady=5)
        # existing items list
        ctk.CTkLabel(self.inner_ui, text="Existing Items",font=("Roboto", 14, "bold")).grid(row=5, column=0, columnspan=4, pady=10)
        ctk.CTkLabel(self.inner_ui, text="Item", font=("Roboto", 12, "bold")).grid(row=6, column=0, padx=5)
        ctk.CTkLabel(self.inner_ui, text="Category", font=("Roboto", 12, "bold")).grid(row=6, column=1, padx=5)
        ctk.CTkLabel(self.inner_ui, text="Price", font=("Roboto", 12, "bold")).grid(row=6, column=2, padx=5)
        ctk.CTkLabel(self.inner_ui, text="Actions", font=("Roboto", 12, "bold")).grid(row=6, column=3, padx=5)
        for i, (item_id, name, price, category) in enumerate(items):
            ctk.CTkLabel(self.inner_ui, text=name).grid(row=i+7, column=0, padx=5, pady=3)
            ctk.CTkLabel(self.inner_ui, text=category).grid(row=i+7, column=1, padx=5, pady=3)
            # inline price entry for editing
            price_entry = ctk.CTkEntry(self.inner_ui, width=80)
            price_entry.insert(0, str(price))
            price_entry.grid(row=i+7, column=2, padx=5, pady=3)
            ctk.CTkButton(self.inner_ui, text="Update",width=60,command=lambda iid=item_id, pe=price_entry: self.update_price(iid, pe)).grid(row=i+7, column=3, padx=2, pady=3)
            ctk.CTkButton(self.inner_ui, text="Delete",width=60, fg_color="red",command=lambda iid=item_id: self.delete_item(iid)).grid(row=i+7, column=4, padx=2, pady=3)
    def add_item(self):
        name = self.new_name.get().strip()
        price = self.new_price.get().strip()
        category = self.new_cat.get()
        if not name or not price:
            messagebox.showerror("Error", "Please fill in all fields")
            return
        self.db.add_menu_item(name, float(price), category)
        self.show_manage_items()
    def update_price(self, item_id, price_entry):
        new_price = price_entry.get().strip()
        if not new_price:
            messagebox.showerror("Error", "Please enter a price")
            return
        self.db.update_item_price(item_id, float(new_price))
    def delete_item(self, item_id):
        if messagebox.askyesno("Confirm", "Delete this item?"):
            self.db.delete_menu_item(item_id)
            self.show_manage_items()
    def save_schedule(self):
        for (day, meal), (drop, var) in self.schedule_dropdowns.items():
            selected = var.get()
            if selected != "Select Item":
                item_id = self.item_map[selected]
                self.db.update_daily_item(day, meal, item_id)
        messagebox.showinfo("Success", "Schedule saved successfully")
    def back_bt(self):
         for widget in self.root.winfo_children():
            widget.destroy()
         mainmenu(self.root, self.db, self.session)
if __name__ == "__main__":   
    root = ctk.CTk()
    ctk.set_default_color_theme("green")
    db = database()       
    session = Session()
    login(root, db, session)
    root.mainloop()
    
    


