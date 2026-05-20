# EAC HR — build and run as WAR

The project is already `<packaging>war</packaging>`. Data stays in **MySQL `eac_hr_db`** — you do **not** re-seed when opening the app again.

**Faculty teaching pay** is only in the **payroll app** (`teaching_pay` table). HR no longer has teaching-pay screens.

---

## First time (one-time setup)

### 1. Prerequisites

- **Java 21** (`java -version`)
- **MySQL** running with database **`eac_hr_db`**
- Demo data already loaded (seeds + TCMS import) on **this** MySQL instance

### 2. Build the WAR

Stop HR on port **8080** if it is running (`Ctrl+C` in the terminal, or stop Run in IDE).

```powershell
cd C:\Users\atash\Downloads\eac-hr\eac-hr
.\mvnw.cmd clean package -DskipTests
```

Output file:

```
target\employee-0.0.1-SNAPSHOT.war
```

You can copy this `.war` to a USB, another PC, or Tomcat `webapps\`.

---

## Every time you run HR as a WAR (repeatable)

### Option A — `java -jar` (easiest, same as port 8080)

1. **Start MySQL** (XAMPP MySQL or Windows service).
2. **Stop** anything else on **8080** (old `spring-boot:run`, Tomcat, or previous `java -jar`).
3. Run:

```powershell
cd C:\Users\atash\Downloads\eac-hr\eac-hr
java -jar target\employee-0.0.1-SNAPSHOT.war
```

4. Open: **http://localhost:8080/**
5. Stop: **Ctrl+C** in that terminal.

You do **not** run seed SQL again unless MySQL was wiped empty.

### Option B — Apache Tomcat (school server)

1. **Start MySQL** on the server (or point app at a remote MySQL IP).
2. Copy `employee-0.0.1-SNAPSHOT.war` to `tomcat\webapps\`
   - Optional rename: `eac-hr.war` → URL **http://server:8080/eac-hr/**
3. Start Tomcat (`bin\startup.bat`).
4. Wait 30–60 seconds for deploy.
5. Open the URL above.

Stop Tomcat: `bin\shutdown.bat` before redeploying a **new** WAR (replace file, delete old `webapps\employee*` folder if needed).

---

## After you change Java/HTML code

1. Stop the running WAR / Tomcat / `spring-boot:run`.
2. Rebuild:

```powershell
.\mvnw.cmd clean package -DskipTests
```

3. Run again (`java -jar` or redeploy to Tomcat).

You still do **not** re-seed the database unless you reset MySQL.

---

## Dev vs WAR (what to use when)

| Goal | Command |
|------|---------|
| Daily coding | `.\mvnw.cmd spring-boot:run` |
| Test production package | `java -jar target\employee-0.0.1-SNAPSHOT.war` |
| School server | Tomcat + WAR in `webapps` |

Do **not** run `spring-boot:run` and `java -jar` **at the same time** on **8080**.

Payroll can stay on **8081** separately (`payroll-system`).

---

## Another device / classroom PC

- **Same data:** use the **same MySQL** (network IP in `DB_URL`) or **import a mysqldump** once.
- **Not required each login:** seeds + TCMS import only for an **empty** database.

Example env before `java -jar` on another PC:

```powershell
$env:DB_URL="jdbc:mysql://192.168.1.10:3306/eac_hr_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Manila"
$env:DB_USERNAME="root"
$env:DB_PASSWORD="7002"
java -jar target\employee-0.0.1-SNAPSHOT.war
```

---

## Production tip

Set `spring.jpa.hibernate.ddl-auto=none` via env or profile on the server so schema is not auto-altered:

```powershell
$env:SPRING_JPA_HIBERNATE_DDL_AUTO="none"
```

---

## Quick checklist

- [ ] MySQL up, `eac_hr_db` has data  
- [ ] Port 8080 free  
- [ ] `mvnw clean package`  
- [ ] `java -jar target\employee-0.0.1-SNAPSHOT.war`  
- [ ] http://localhost:8080/ loads HR login  
