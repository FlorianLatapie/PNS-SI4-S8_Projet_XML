<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <title>Liste de tous les encadrants</title>
            </head>
            <body>
                <h1>Liste de tous les encadrants</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>type d'encadrant</th>
                            <th>activités encadrées</th>
                            <th>langues</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="agence/encadrants/*">
                            <tr>
                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@nom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@prenom"/>
                                </td>
                                <td>
                                    <!--xml class-->
                                    <xsl:value-of select="name()"/>
                                </td>
                                <td>
                                    <xsl:for-each select="activites">
                                        <xsl:value-of select="@nom"/>
                                        <xsl:if test="position() != last()">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:for-each select="languesParlees | coursLangue">
                                        <xsl:value-of select="@nom"/>
                                        <xsl:if test="position() != last()">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
