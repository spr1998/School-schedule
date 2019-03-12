<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Orari</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="/Orari/jsFunctions.js"></script>
                <link rel="stylesheet" type="text/css" href="xsl-css.css"/>
            </head>

            <body>

                <table>
                    <tr>
                        <td id = "header">
                            <form method="Post" action="orari.php">
                                <select class="degree" name="degree" id="degree" onchange="showYears()">
                                </select>
                                <select class="year" name="year" id="year" onchange="showParalel()" >
                                    <option>Zgjidh vitin</option>
                                </select>
                                <select class="paraleli" name="paraleli" id="paraleli">
                                    <option>Zgjidh paralelin</option>
                                </select>
                                <input type="submit" name="afisho" id="afisho" value="Afisho" class="btn btn-primary"/>
                            </form>
                        </td>
                    </tr>
                </table>

                <table  width="100%" style="padding:15px">
                    <thead>
                        <tr>
                            <th width="10%" style="padding: 20px"></th>
                            <th width="18%" >E Hene</th>
                            <th width="18%">E Marte</th>
                            <th width="18%">E Merkure</th>
                            <th width="18%">E Enjte</th>
                            <th width="18%">E Premte</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:variable name="paramParaleli" select="school/params/paramParaleli" />
                        <xsl:variable name="paramViti" select="school/params/paramViti" />

                        <xsl:for-each select="school/oraret">
                            <tr>
                                <td><xsl:value-of select="@ora"/></td>
                                <xsl:for-each select="orari">
                                    <xsl:if test='$paramViti = viti'>
                                        <xsl:if test=' $paramParaleli = paraleli'>
                                            <xsl:choose>
                                                <xsl:when test='lenda = ""'>
                                                    <td >
                                                        <xsl:choose>
                                                            <xsl:when test='dita = "E Hene"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /><br />
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Marte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /><br />
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Merkure"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /><br />
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Enjte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /><br />
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Premte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /><br />
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                        </xsl:choose>

                                                    </td>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <td style="background:lightgreen">
                                                        <xsl:choose>
                                                            <xsl:when test='dita = "E Hene"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /> / 
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Marte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /> / 
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Merkure"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /> / 
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Enjte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /> / 
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                            <xsl:when test='dita = "E Premte"'>
                                                                <xsl:value-of select="lenda" /><br />   
                                                                <xsl:value-of select="tipi" /> / 
                                                                <xsl:value-of select="pedagog" /><br />
                                                                <xsl:value-of select="klasa" />

                                                            </xsl:when>
                                                        </xsl:choose>

                                                    </td>
                                                </xsl:otherwise>
                                            </xsl:choose>

                                        </xsl:if>
                                    </xsl:if>
                                </xsl:for-each>
                            </tr>        
                        </xsl:for-each>
                    </tbody>
                </table> 
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>