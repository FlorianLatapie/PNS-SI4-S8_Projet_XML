<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <!--nouvelle base de données qui regroupe les séjours linguistiques
    par destination dans une nouvelle structure-->
    <xsl:template match="/">
        <sejours>
            <!-- Pour chaque destination -->
            <xsl:for-each select="agence/voyages/offre">
                <!-- Groupement par destination -->
                <xsl:variable name="destination">
                    <xsl:value-of select="destination"/>
                </xsl:variable>
                <xsl:if test="generate-id() = generate-id(key('dest', $destination)[1])">
                    <destination nom="{destination}">
                        <!-- Pour chaque offre ayant cette destination -->
                        <xsl:for-each select="key('dest', $destination)">
                            <sejour>
                                <xsl:copy-of select="nom"/>
                                <xsl:copy-of select="type"/>
                                <xsl:copy-of select="description"/>
                                <xsl:copy-of select="duree"/>
                                <xsl:copy-of select="nbMaxParticipants"/>
                                <xsl:copy-of select="prix"/>
                            </sejour>
                        </xsl:for-each>
                    </destination>
                </xsl:if>
            </xsl:for-each>
        </sejours>
    </xsl:template>

    <!-- Indexation de l'offre par destination -->
    <xsl:key name="dest" match="offre" use="destination"/>

</xsl:stylesheet>
