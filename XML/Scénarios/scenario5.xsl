<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Clients -->
    <xsl:template match="clients">
        <xsl:variable name="clients">
            <xsl:apply-templates select="client" />
        </xsl:variable>
        {
        "clients": {
        <xsl:apply-templates select="$clients" mode="json" />
        }
        }
    </xsl:template>

    <!-- Encadrants -->
    <xsl:template match="encadrants">q
        <xsl:variable name="encadrants">
            <xsl:apply-templates select="encadrant | accompagnateur | enseignant" />
        </xsl:variable>
        {
        "encadrants": {
        <xsl:apply-templates select="$encadrants" mode="json" />
        }
        }
    </xsl:template>

    <!-- Voyages -->
    <xsl:template match="voyages">
        <xsl:variable name="offres">
            <xsl:apply-templates select="offre" />
        </xsl:variable>
        {
        "voyages": {
        "offres": [
        <xsl:apply-templates select="$offres" mode="json" />
        ]
        }
        }
    </xsl:template>

    <!-- Clients: JSON mode -->
    <xsl:template match="client" mode="json">
        <xsl:if test="position() > 1">,</xsl:if>
        "<xsl:value-of select="@id" />": {
        "type": "<xsl:value-of select="@type" />",
        "nom": "<xsl:value-of select="@nom" />",
        "prenom": "<xsl:value-of select="@prenom" />"
        }
    </xsl:template>

    <!-- Encadrants: JSON mode -->
    <xsl:template match="encadrant | accompagnateur | enseignant" mode="json">
        <xsl:if test="position() > 1">,</xsl:if>
        "<xsl:value-of select="@id" />": {
        "type": "<xsl:value-of select="name()"/>
        "nom": "<xsl:value-of select="@nom" />",
        "prenom": "<xsl:value-of select="@prenom" />",
        <xsl:apply-templates select="*" />
        }
    </xsl:template>

    <!-- Accompagnateur: JSON mode -->
    <xsl:template match="accompagnateur" mode="json">
        "type": "Accompagnateur",
        "activites": [
        <xsl:apply-templates select="activites" mode="json" />
        ],
        "languesParlees": [
        <xsl:apply-templates select="languesParlees" mode="json" />
        ]
    </xsl:template>

    <!-- Enseignant: JSON mode -->
    <xsl:template match="enseignant" mode="json">
        "type": "Enseignant",
        "coursLangue": [
        <xsl:apply-templates select="coursLangue" mode="json" />
        ]
    </xsl:template>

    <!-- Activites & CoursLangue: JSON mode -->
    <xsl:template match="activites | languesParlees | coursLangue" mode="json">
        <xsl:if test="position() > 1">,</xsl:if>
        "<xsl:value-of select="@nom" />"
    </xsl:template>

    <!-- Offre: JSON mode -->
    <xsl:template match="offre" mode="json">
        <xsl:if test="position() > 1">,</xsl:if>
        {
        "id": "<xsl:value-of select="@id" />",
        "destination": "<xsl:value-of select="@destination" />",
        "dateDepart": "<xsl:value-of select="@dateDepart" />",
        "dateRetour": "<xsl:value-of select="@dateRetour" />",
        "prix": "<xsl:value-of select="@prix" />",
        "nbPlaces": "<xsl:value-of select="@nbPlaces" />",
        "encadrant": "<xsl:value-of select="@encadrant" />",
        "accompagnateur": "<xsl:value-of select="@accompagnateur" />",
        "enseignant": "<xsl:value-of select="@enseignant" />",
        "clients": [
        <xsl:apply-templates select="clients" mode="json" />
        ]
        }
    </xsl:template>

    <!-- Clients: JSON mode -->
    <xsl:template match="clients" mode="json">
        <xsl:apply-templates select="client" mode="json" />
    </xsl:template>

    <!-- Clients: JSON mode -->
    <xsl:template match="client" mode="json">
        <xsl:if test="position() > 1">,</xsl:if>
        "<xsl:value-of select="@id" />"
    </xsl:template>

</xsl:stylesheet>

