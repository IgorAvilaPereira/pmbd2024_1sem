package pmbd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/academia";

        
        // String nome = JOptionPane.showMessageDialog(null, "digite:", "digite", JOptionPane.INFORMATION_MESSAGE);

        String sql = """
            INSERT INTO cliente (nome, cpf, data_nascimento)
            VALUES ('RAFAEL BETITO', '11111111112', '1987-01-20');
            """;

        Connection conexao = DriverManager.getConnection(url, "postgres", "postgres");
        conexao.createStatement().execute(sql);    
    }
}