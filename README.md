# Aufgabe 1: Weitere AWS Ressource
Abgabe: Commit

Erstellt mit Hilfe von Terraform einen weiteren AWS Service abgesehen von EC2 oder S3 (z.B. DynamoDB, Lambda)
Bereitet euch bitte darauf vor, das Ganze am Montag vorzustellen, wie ihr das machen wollt ist euch überlassen.
Ihr könnt diese Aufgabe gerne in Gruppen bearbeiten.
![dynamoDB](image.png)


![dynamoDB output](image-1.png)


![dynamoDB-aws-console](image-2.png)


![dynamoDB destroy](image-3.png)


![dynamoDB destroy aws-management console](image-4.png)


# Aufgabe 2: Kontrollfragen

### 2.1 Wieso sollte man den State nicht im GitHub-Repository hinterlegen, sondern z.B. in einem S3-Bucket?

Der Terraform-Status (`terraform.tfstate`) ist eine wichtige Datei, die den aktuellen Zustand der Infrastruktur beschreibt, die durch Terraform verwaltet wird. Der Hauptgrund, warum der Status nicht im GitHub-Repository, sondern in einem S3-Bucket oder einem anderen geeigneten Speicherort aufbewahrt werden sollte, sind:

1. **Sicherheit**:
   - Der `terraform.tfstate`-Datei kann sensible Informationen enthalten, wie z.B. Verbindungsdetails oder andere sensible Daten, die durch die Infrastruktur konfiguriert wurden. Das Speichern dieser Datei im GitHub-Repository kann ein Sicherheitsrisiko darstellen, insbesondere wenn das Repository öffentlich ist oder nicht gut gesichert wird.

2. **Kollaboration**:
   - Wenn mehrere Personen an einem Terraform-Projekt arbeiten, kann das gleichzeitige Arbeiten mit der `terraform.tfstate`-Datei zu Konflikten und Inkonsistenzen führen, wenn mehrere Entwickler gleichzeitig Änderungen an der Infrastruktur vornehmen. Ein zentraler Speicherort wie ein S3-Bucket (idealerweise mit Locking-Funktionalität) ermöglicht eine koordinierte Verwaltung und verhindert Konflikte.

3. **Zustandsverwaltung**:
   - Terraform benötigt eine zentrale und konsistente `tfstate`-Datei, um den aktuellen Zustand der Infrastruktur nachzuvollziehen. Ein S3-Bucket, häufig zusammen mit DynamoDB für Locking-Zwecke verwendet, bietet eine zuverlässige und zentrale Verwaltung des Status, einschließlich Unterstützung für das Sperren der Datei, um zu verhindern, dass mehrere Terraform-Prozesse gleichzeitig Änderungen vornehmen.

4. **Backup und Wiederherstellung**:
   - Die Speicherung im S3-Bucket bietet eine integrierte Backup- und Wiederherstellungsfunktionalität. AWS S3 bietet Versionierung und Datenwiederherstellung, die es erleichtern, frühere Versionen des Status wiederherzustellen, falls ein Problem auftritt.

5. **Skalierbarkeit**:
   - Die Verwendung eines zentralisierten Speichers wie S3 ist skalierbarer und eignet sich besser für große oder verteilte Teams, da sie den Status nahtlos über verschiedene Umgebungen und Teams hinweg verwalten kann.

### 2.2 Was ist der Unterschied zwischen `variables` und der `terraform.tfvars`-Datei?

**Antwort:**

- **`variables` (in der `main.tf` oder einer anderen `.tf`-Datei definiert)**:
  - In Terraform werden Variablen in `.tf`-Dateien durch den `variable`-Block definiert. Diese Definitionen legen die Namen, Typen, Standardwerte und Beschreibungen der Variablen fest. Sie dienen als Platzhalter für Werte, die zur Laufzeit angegeben werden können.

  **Beispiel:**
  ```hcl
  variable "instance_type" {
    description = "The type of EC2 instance to create"
    type        = string
    default     = "t2.micro"
  }
  ```

- **`terraform.tfvars`**:
  - Die `terraform.tfvars`-Datei ist eine spezielle Datei, die dazu verwendet wird, Werte für die Variablen, die in den `variable`-Blöcken definiert wurden, bereitzustellen. Diese Datei wird von Terraform automatisch erkannt und verwendet, um die Werte der Variablen zu überschreiben, die in der Terraform-Konfiguration verwendet werden. 

  **Beispiel:**
  ```hcl
  instance_type = "t3.large"
  ```

**Zusammenfassung der Unterschiede:**

1. **Definition vs. Zuweisung**:
   - `variables`-Blöcke in Terraform-Dateien definieren, was die Variablen sind und wie sie verwendet werden sollen.
   - Die `terraform.tfvars`-Datei gibt die konkreten Werte für diese Variablen an.

2. **Verwendung**:
   - `variables` sind in der Konfiguration definiert und bieten eine Möglichkeit, Werte zur Laufzeit zu steuern.
   - `terraform.tfvars` wird verwendet, um die konkreten Werte zu setzen, die für die Variablen verwendet werden sollen.

3. **Flexibilität**:
   - `variables` ermöglichen eine strukturierte Definition der benötigten Daten.
   - `terraform.tfvars` erlaubt es, unterschiedliche Werte für verschiedene Umgebungen oder Szenarien bereitzustellen, ohne die Hauptkonfiguration zu ändern.

4. **Sicherheit und Verwaltung**:
   - Variablen können Default-Werte und Beschreibungen haben, die die Konfiguration dokumentieren.
   - `terraform.tfvars` ist nützlich, um Umgebungs- oder situationsspezifische Werte zu verwalten, und sollte möglicherweise von der Versionskontrolle ausgeschlossen werden, wenn sensible Daten enthalten sind.
