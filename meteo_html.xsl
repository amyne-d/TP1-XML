<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Températures des villes</title>
                
                <style>
                    body {
                    font-family: Arial;
                    background-color: #eef2f3;
                    text-align: center;
                    }
                    
                    h1 {
                    color: #1565c0;
                    }
                    
                    table {
                    margin: 20px auto;
                    border-collapse: collapse;
                    width: 70%;
                    background-color: white;
                    }
                    
                    th, td {
                    border: 1px solid #999;
                    padding: 12px;
                    }
                    
                    th {
                    background-color: #1565c0;
                    color: white;
                    }
                    
                    tr:nth-child(even) {
                    background-color: #e3f2fd;
                    }
                </style>
                
            </head>
            
            <body>
                
                <h1>Mesures des températures des villes</h1>
                
                <xsl:for-each select="meteo/mesure">
                    
                    <h2>
                        Date :
                        <xsl:value-of select="@date"/>
                    </h2>
                    
                    <table>
                        <tr>
                            <th>Ville</th>
                            <th>Température (°C)</th>
                        </tr>
                        
                        <xsl:for-each select="ville">
                            
                            <tr>
                                <td>
                                    <xsl:value-of select="@nom"/>
                                </td>
                                
                                <td>
                                    <xsl:value-of select="@temperature"/>
                                </td>
                            </tr>
                            
                        </xsl:for-each>
                        
                    </table>
                    
                </xsl:for-each>
                
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>