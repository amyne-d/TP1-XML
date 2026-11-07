<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Histogramme des températures</title>
            </head>
            
            <body style="font-family:Arial; text-align:center;">
                
                <h1>Histogramme des températures</h1>
                
                <xsl:for-each select="meteo/mesure">
                    
                    <h2>
                        Date :
                        <xsl:value-of select="@date"/>
                    </h2>
                    
                    <svg xmlns="http://www.w3.org/2000/svg"
                        width="900"
                        height="280"
                        viewBox="0 0 900 280">
                        
                        <line x1="40" y1="210"
                            x2="870" y2="210"
                            stroke="black"
                            stroke-width="2"/>
                        
                        <line x1="40" y1="30"
                            x2="40" y2="210"
                            stroke="black"
                            stroke-width="2"/>
                        
                        <text x="450" y="270"
                            text-anchor="middle"
                            font-size="16">
                            Villes
                        </text>
                        
                        <text x="15" y="20"
                            font-size="12">
                            °C
                        </text>
                        
                        <xsl:for-each select="ville">
                            
                            <rect
                                x="{60 + (position() - 1) * 100}"
                                y="{210 - number(@temperature) * 5}"
                                width="55"
                                height="{number(@temperature) * 5}"
                                fill="#3498db">
                                
                                <animate
                                    attributeName="height"
                                    from="0"
                                    to="{number(@temperature) * 5}"
                                    dur="2s"
                                    fill="freeze"/>
                                
                                <animate
                                    attributeName="y"
                                    from="210"
                                    to="{210 - number(@temperature) * 5}"
                                    dur="2s"
                                    fill="freeze"/>
                                
                            </rect>
                            
                            <text
                                x="{87.5 + (position() - 1) * 100}"
                                y="230"
                                font-size="12"
                                text-anchor="middle">
                                
                                <xsl:value-of select="@nom"/>
                                
                            </text>
                            
                            <text
                                x="{87.5 + (position() - 1) * 100}"
                                y="{200 - number(@temperature) * 5}"
                                font-size="12"
                                text-anchor="middle"
                                fill="black">
                                
                                <xsl:value-of select="@temperature"/>
                                
                            </text>
                            
                        </xsl:for-each>
                        
                    </svg>
                    
                </xsl:for-each>
                
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>