/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClassPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mergu
 */
public class Temlik {

    DbConnect dbConnect = new DbConnect();
    public ArrayList<String> TabloBaşlık;
    public ArrayList<String> TemlikVerenFirma;
    public ArrayList<String> VergiNo;
    public ArrayList<String> FaturaTarihi;
    public ArrayList<String> FaturaNo;
    public ArrayList<String> FaturaTutarı;
    public ArrayList<String> DamgaVergisiKesintisi;
    public ArrayList<String> DiğerKesinti;
    public ArrayList<String> ÖdenecekTutar;
    public ArrayList<String> FişNo;
    public ArrayList<String> Yıl;
    public ArrayList<String> TemlikNo;
    public ArrayList<String> TemlikAlanFirma;
    public ArrayList<String> TemlikAlanFirmaVergiNo;

    public void temlikGetir() {
        TemlikVerenFirma = new ArrayList<>();
        VergiNo = new ArrayList<>();
        TabloBaşlık = new ArrayList<>();
        FaturaTarihi = new ArrayList<>();
        FaturaNo = new ArrayList<>();
        FaturaTutarı = new ArrayList<>();
        DamgaVergisiKesintisi = new ArrayList<>();
        DiğerKesinti = new ArrayList<>();
        ÖdenecekTutar = new ArrayList<>();
        FişNo = new ArrayList<>();
        Yıl = new ArrayList<>();
        TemlikNo = new ArrayList<>();
        TemlikAlanFirma = new ArrayList<>();
        TemlikAlanFirmaVergiNo = new ArrayList<>();
        try {
            Statement statement = dbConnect.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from temlik");
            while (resultSet.next()) {
                TemlikVerenFirma.add(resultSet.getString("TEMLİK VEREN FİRMA"));
                VergiNo.add(resultSet.getString("VERGİ NO"));
                FaturaTarihi.add(resultSet.getString("FATURA TARİHİ"));
                FaturaNo.add(resultSet.getString("FATURA NO"));
                FaturaTutarı.add(resultSet.getString("FATURA TUTARI"));
                DamgaVergisiKesintisi.add(resultSet.getString("DAMGA VERGİSİ KESİNTİSİ"));
                DiğerKesinti.add(resultSet.getString("DİĞER KESİNTİ (CEZA/EK KESİN TEMİNAT)"));
                ÖdenecekTutar.add(resultSet.getString("ÖDENECEK TUTAR"));
                FişNo.add(resultSet.getString("FİŞ NO"));
                Yıl.add(resultSet.getString("YIL"));
                TemlikNo.add(resultSet.getString("TEMLİK NO"));
                TemlikAlanFirma.add(resultSet.getString("TEMLİK ALAN FİRMA"));
                TemlikAlanFirmaVergiNo.add(resultSet.getString("TEMLİK ALAN FİRMA VERGİ NO"));
            }
            for (int i = 0; i < resultSet.getMetaData().getColumnCount(); i++) {
                TabloBaşlık.add(resultSet.getMetaData().getColumnName(i+1));
            }

            resultSet.close();
            statement.close();
            dbConnect.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Temlik.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
