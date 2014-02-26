/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Usuario;

/**
 *
 * @author achang
 */
public interface UsuarioDao {
    public Usuario findByUsuario(Usuario usuario);
    public Usuario login(Usuario usuario);
    
}
