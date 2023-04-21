<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <title>Séjours linguistiques pour les familles</title>
            </head>
            <body>
                <h1>Séjours linguistiques pour les familles</h1>
                <table>
                    <tr>
                        <th>Type de séjour</th>
                        <th>Destination</th>
                        <th>Description</th>
                        <th>Date début</th>
                        <th>Date fin</th>
                        <th>Langues</th>
                        <th>Prix</th>
                        <th>Limite de participants</th>
                    </tr>
                    <xsl:for-each select="agence/voyages/offre[trancheAge='Enfant']">
                        <tr>
                            <td>
                                <xsl:value-of select="type"/>
                            </td>
                            <td>
                                <xsl:value-of select="destination"/>
                            </td>
                            <td>
                                <xsl:value-of select="description"/>
                            </td>
                            <td>
                                <xsl:variable name="debut" select="duree/debut"/>
                                <xsl:value-of select="substring($debut, 9, 2)"/>/<xsl:value-of select="substring($debut, 6, 2)"/>/<xsl:value-of select="substring($debut, 1, 4)"/>
                            </td>
                            <td>
                                <xsl:variable name="fin" select="duree/fin"/>
                                <xsl:value-of select="substring($fin, 9, 2)"/>/<xsl:value-of select="substring($fin, 6, 2)"/>/<xsl:value-of select="substring($fin, 1, 4)"/>
                            </td>
                            <td>
                                <xsl:value-of select="langue/@nom"/>
                            </td>
                            <td>
                                <xsl:value-of select="concat(prix,'€')"/>
                            </td>
                            <td>
                                <xsl:value-of select="nbMaxParticipants"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>