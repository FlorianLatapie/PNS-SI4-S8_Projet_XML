<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--nouvelle base de données qui regroupe les séjours linguistiques
    par destination dans une nouvelle structure-->
    <xsl:template match="/">
        <xsl:text>&#xa;</xsl:text>
        <sejours>
            <xsl:text>&#xa;</xsl:text>
            <!-- Pour chaque destination -->
            <xsl:for-each select="agence/voyages/offre">
                <!-- Groupement par destination -->
                <xsl:variable name="destination">
                    <xsl:value-of select="destination"/>
                </xsl:variable>
                <xsl:if test="generate-id() = generate-id(key('dest', $destination)[1])">
                    <xsl:text>&#9;</xsl:text>
                    <destination nom="{destination}">
                        <!-- Pour chaque offre ayant cette destination -->
                        <xsl:for-each select="key('dest', $destination)">
                            <xsl:text>&#xa;&#9;&#9;</xsl:text>
                            <sejour>
                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="nom"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="type"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="description"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="duree"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="nbMaxParticipants"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                                <xsl:copy-of select="prix"/>

                                <xsl:text>&#xa;&#9;&#9;&#9;</xsl:text>
                            </sejour>
                        </xsl:for-each>
                        <xsl:text>&#xa;&#9;</xsl:text>
                    </destination>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:text>&#xa;</xsl:text>
        </sejours>
    </xsl:template>

    <!-- Indexation de l'offre par destination -->
    <xsl:key name="dest" match="offre" use="destination"/>

</xsl:stylesheet>
