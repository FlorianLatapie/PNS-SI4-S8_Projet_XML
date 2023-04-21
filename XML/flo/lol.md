Schéma en PlantUML:

```
class Root {
    
}

class OffreSejour {
    id: string
    langue: Langue
    destination: string
    prix: Polypoints
    type: Colonie | GroupeScolaire | Immersion
}

OffreSejour .. "0..*" Activite: activites

Root .. "0..*" Sejour: sejours
Root .. "0..*" OffreSejour: offres

class Sejour {
    id: string
}

struct DateSejour {
    debut: Date
    fin: Date
}

OffreSejour .. "1..*" DateSejour: datesProposees

Sejour .. "1" DateSejour: dates

Sejour .. "1" OffreSejour: offre

class Client {
    id: string
    identite: Identite
    type: Adulte | Famille | Enfant
}

class Accompagnateur {
    id: string
    identite: Identite
}

class Enseignant {
    id: string
    identite: Identite
}

struct Identite {
    nom: string
    prenom: string
}

class Activite {
    id: string
    nom: string
    type: Sport | Culturel
}

class CoursLangue {
    id: string
    niveau: A1..C2
}

CoursLangue .. "1" Enseignant: prof

OffreSejour .. "1..*" CoursLangue: cours

Root .. "0..*" Accompagnateur: accompagnateurs

Root .. "0..*" Client: clients
Sejour "0..*" .. "0..*" Client: clients
Sejour "0..*" .. "0..*" Accompagnateur: accompagnateurs
```

Maintenant schéma XML (XSD) en veillant à utiliser des types simples, types complexes. Pour les types union, utiliser
des énumérations xsd.

```xml

<schema xmlns="http://www.w3.org/2001/XMLSchema">
    <complexType name="Identite">
        <sequence>
            <element name="nom" type="string"/>
            <element name="prenom" type="string"/>
        </sequence>
    </complexType>

    <complexType name="Client">
        <sequence>
            <element name="id" type="string"/>
            <element name="identite" type="Identite"/>
            <element name="type" type="TypeClient"/>
        </sequence>
    </complexType>

    <simpleType name="TypeClient">
        <restriction base="string">
            <enumeration value="Adulte"/>
            <enumeration value="Famille"/>
            <enumeration value="Enfant"/>
        </restriction>
    </simpleType>

    <complexType name="Accompagnateur">
        <sequence>
            <element name="id" type="string"/>
            <element name="identite" type="Identite"/>
        </sequence>
    </complexType>

    <complexType name="Enseignant">
        <sequence>
            <element name="id" type="string"/>
            <element name="identite" type="Identite"/>
        </sequence>
    </complexType>

    <simpleType name="TypeActivite">
        <restriction base="string">
            <enumeration value="Sport"/>
            <enumeration value="Culturel"/>
        </restriction>
    </simpleType>

    <complexType name="Activite">
        <sequence>
            <element name="id" type="string"/>
            <element name="nom" type="string"/>
            <element name="type" type="TypeActivite"/>
        </sequence>
    </complexType>

    <simpleType name="Niveau">
        <restriction base="string">
            <enumeration value="A1"/>
            <enumeration value="A2"/>
            <enumeration value="B1"/>
            <enumeration value="B2"/>
            <enumeration value="C1"/>
            <enumeration value="C2"/>
        </restriction>
    </simpleType>

    <complexType name="CoursLangue">
        <sequence>
            <element name="id" type="string"/>
            <element name="niveau" type="Niveau"/>
            <element name="enseignant" type="Enseignant"/>
        </sequence>
    </complexType>

    <complexType name="DateSejour">
        <sequence>
            <element name="debut" type="date"/>
            <element name="fin" type="date"/>
        </sequence>
    </complexType>

    <complexType name="OffreSejour">
        <sequence>
            <element name="id" type="string"/>
            <element name="langue" type="string"/>
            <element name="destination" type="string"/>
            <element name="prix" type="integer"/>
            <element name="type" type="TypeOffreSejour"/>
            <element name="activites" type="Activite" minOccurs="0" maxOccurs="unbounded"/>
            <element name="datesProposees" type="DateSejour" minOccurs="1" maxOccurs="unbounded"/>
            <element name="cours" type="CoursLangue" minOccurs="1" maxOccurs="unbounded"/>
        </sequence>
    </complexType>

    <simpleType name="TypeOffreSejour">
        <restriction base="string">
            <enumeration value="Colonie"/>
            <enumeration value="GroupeScolaire"/>
            <enumeration value="Immersion"/>
        </restriction>
    </simpleType>

    <complexType name="Sejour">
        <sequence>
            <element name="id" type="string"/>
            <element name="offre" type="OffreSejour"/>
            <element name="dates" type="DateSejour"/>
            <element name="clients" type="Client" minOccurs="0" maxOccurs="unbounded"/>
            <element name="accompagnateurs" type="Accompagnateur" minOccurs="0" maxOccurs="unbounded"/>
        </sequence>
    </complexType>

    <complexType name="Root">
        <sequence>
            <element name="clients" type="Client" minOccurs="0" maxOccurs="unbounded"/>
            <element name="accompagnateurs" type="Accompagnateur" minOccurs="0" maxOccurs="unbounded"/>
            <element name="offres" type="OffreSejour" minOccurs="0" maxOccurs="unbounded"/>
            <element name="sejours" type="Sejour" minOccurs="0" maxOccurs="unbounded"/>
        </sequence>
    </complexType>

    <element name="root" type="Root"/>
</schema>
```
