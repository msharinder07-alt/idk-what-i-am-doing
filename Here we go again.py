import customtkinter as ctk
import pymysql
from tkinter import messagebox, filedialog
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.backends.backend_pdf import PdfPages
from PIL import Image
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
#session exists so that we know the user and their role from the very beginning, so that we don't have to call a query every time we need info
class Session:
    def __init__(self):
        self.user_id = None
        self.role = None
        self.grade= None
    def login(self, user_id, role,grade):
        self.user_id = user_id
        self.role = role
        self.grade= grade
    def logout(self):
        self.user_id = None
        self.role = None
        self.grade= None
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
        password=self.u_p_e.get().strip()
        if not user_id or not password:
            messagebox.showerror("Error", "Please fill in both fields.")
            return
        result = self.db.ver_log(user_id, password)
        resul=self.db.ver_log(user_id, password)
        if result is None:
            messagebox.showerror("Error", "Invalid credentials.")
            return
        role=result[0][2]
        grade = resul[1][0]
        self.session.login(user_id, role, grade)  #session knows who is logged in
        for widget in self.root.winfo_children():
            widget.destroy()
        mainmenu(self.root, self.db, self.session)
class mainmenu:
    def __init__(self,root,db,session):
        self.root=root
        self.db=db
        self.session=session
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        butwid=140
        butheight=100
        font=ctk.CTkFont( size=16, weight="bold")
        ctk.CTkButton(self.inner_ui, text="Report Card", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(Reportcard)).grid(row=0, column=0, padx=10, pady=10)
        ctk.CTkButton(self.inner_ui, text="Attendance", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(attendance)).grid(row=0, column=1, padx=10, pady=10)
        ctk.CTkButton(self.inner_ui, text="Announcements", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(announcements)).grid(row=1, column=0, padx=10, pady=10)
        ctk.CTkButton(self.inner_ui, text="User Details", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(userdetails)).grid(row=1, column=1, padx=10, pady=10)
        ctk.CTkButton(self.inner_ui, text="Homework", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(homework)).grid(row=2, column=1, padx=10, pady=10)
        ctk.CTkButton(self.inner_ui, text="Canteen", width=butwid, height=butheight, font=font,command= lambda:self.switcheroo(canteen)).grid(row=2, column=0, padx=10, pady=10)
    def switcheroo(self, xyz): #xyz is holding parameter for the class we will be switching to can be anything provided that thingb is undefined atm.
        for widget in self.root.winfo_children():
            widget.destroy()
        xyz(self.root, self.db, self.session)
class attendance:
    def __init__(self,root,db,session):
        self.root=root
        self.root.title("We Better")
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
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
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_btn=ctk.CTkButton(self.inner_ui,text="back",command=self.bck_btn).pack()
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
            for k, i in enumerate(wow):#need the row placement to happen at the same time or else we end up with the same mannouncement
                ctk.CTkLabel(self.inner_ui, text=str(i[0])).grid(row=k+1, column=1)
                ctk.CTkLabel(self.inner_ui, text=str(i[1])).grid(row=k+1, column=2)
                ctk.CTkLabel(self.inner_ui, text=str(i[2])).grid(row=k+1, column=3)
                ctk.CTkLabel(self.inner_ui, text=str(i[3])).grid(row=k+1, column=4)
                ctk.CTkLabel(self.inner_ui, text=str(i[4])).grid(row=k+1, column=0)
        if self.session.role=="Teacher":
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
        self.root.geometry("360x540")
        self.scroll=ctk.CTkScrollableFrame(root)
        self.scroll.pack(fill="both", expand=True, padx=10, pady=10)
        self.inner_ui=ctk.CTkFrame(self.scroll)
        self.inner_ui.pack()
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=7,columnspan=2)
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
        bck_but=ctk.CTkButton(self.inner_ui,text="back",command=self.back_bt).grid(column=0,row=7,columnspan=2)
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
    


