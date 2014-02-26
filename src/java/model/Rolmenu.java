package model;
// Generated 26/02/2014 12:13:03 PM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Rolmenu generated by hbm2java
 */
@Entity
@Table(name="rolmenu"
    ,schema="public"
)
public class Rolmenu  implements java.io.Serializable {


     private int id;
     private Menu menu;
     private Rol rol;

    public Rolmenu() {
    }

    public Rolmenu(int id, Menu menu, Rol rol) {
       this.id = id;
       this.menu = menu;
       this.rol = rol;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="menu_id", nullable=false)
    public Menu getMenu() {
        return this.menu;
    }
    
    public void setMenu(Menu menu) {
        this.menu = menu;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="rol_id", nullable=false)
    public Rol getRol() {
        return this.rol;
    }
    
    public void setRol(Rol rol) {
        this.rol = rol;
    }




}


