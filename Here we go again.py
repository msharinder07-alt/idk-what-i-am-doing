import customtkinter as ctk
from tkintermapview import TkinterMapView
ctk.set_appearance_mode("Dark")  
ctk.set_default_color_theme("green")  
class MapApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Googl Maps")
        self.geometry("1280x720")
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)
      # SIDEBAR PANEL
        self.sidebar = ctk.CTkFrame(self, width=200, corner_radius=20,border_width=3,border_color="#2FA572")
        self.si=ctk.CTkFrame(self,width=200)
        self.sidebar.grid(row=0, column=0, sticky="nsew", padx=0, pady=0)
        self.sidebar.grid_rowconfigure(4, weight=1) # Spacer row
        self.titl_label = ctk.CTkLabel(self.sidebar, text="Googl map", font=ctk.CTkFont(size=16, weight="bold"))
        self.titl_label.grid(row=0, column=0, padx=20, pady=20)
        self.sea_ent = ctk.CTkEntry(self.sidebar, placeholder_text="Enter address")
        self.sea_ent.grid(row=1, column=0, padx=20, pady=10, sticky="ew")
        self.sea_ent.bind("<Return>", lambda e: self.sea_location())
        self.sea_btn = ctk.CTkButton(self.sidebar, text="Search Location", command=self.sea_location)
        self.sea_btn.grid(row=2, column=0, padx=20, pady=10, sticky="ew")
        #MAP
        self.map_wid = TkinterMapView(self, corner_radius=15)
        self.map_wid.grid(row=0, column=1, sticky="nsew", padx=20, pady=20)
        self.map_wid.set_position(12.84144607816242, 77.64803234353236)
        self.map_wid.set_zoom(15)
        self.mark_list = []
    def sea_location(self):
        address = self.sea_ent.get()
        if address:
            self.map_wid.delete_all_marker()
            new_pos = self.map_wid.set_address(address,marker=True)
            new_pos.set_text(address)
            a=new_pos.position
            marker1=self.map_wid.set_marker(a[0],a[1])
        if new_pos:
            self.mark_list.append(new_pos)
            self.mark_list.clear()
if __name__ == "__main__":
    app = MapApp()
    app.mainloop()
