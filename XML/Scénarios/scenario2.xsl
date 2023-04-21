<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <title>Liste de tous les clients</title>
            </head>
            <body>
                <h1>Liste de tous les clients</h1>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Classe d'âge</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="agence/clients/client">
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
                                    <xsl:value-of select="@type"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
