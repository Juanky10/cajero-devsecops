package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Cajero {
    public static void main(String[] args) {
        // Simulación de un input malicioso en el cajero automático
        String pinUsuario = "1234' OR '1'='1"; 
        
        try {
            // 🚨 VULNERABILIDAD SAST 1: Credenciales de base de datos en texto plano
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "admin", "password123");
            Statement statement = conexion.createStatement();
            
            // 🚨 VULNERABILIDAD SAST 2: Inyección SQL por concatenación
            String query = "SELECT saldo FROM cuentas WHERE pin = '" + pinUsuario + "'";
            statement.executeQuery(query);
            
            System.out.println("Operación realizada en el cajero.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}