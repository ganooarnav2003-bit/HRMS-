# HRMS Lite: Requirements and Publishing Guide

## Part 1: Requirements (what the system does)

1. **Dashboard**: total employees, check-ins today, pending leave requests, departments, recent leave requests.
2. **Employee management**: add, search, activate/deactivate, and delete employees (name, email, department, job title, monthly salary).
3. **Attendance**: check in and check out each employee per day; view today's status and recent records.
4. **Leave management**: apply for leave (casual, sick, earned, unpaid), approve or reject requests, with date validation.
5. **Payroll**: monthly estimate per active employee (basic 50%, HRA 20%, allowances 30%, PF 12% of basic) and total net payout.
6. **Data persistence**: data is saved in the browser (localStorage) for this demo.

## Part 2: Run the app locally

Open `index.html` in any browser. No install needed.

## Part 3: Publish with GitHub, Supabase, and Vercel

### Step 1: GitHub (store the code)
1. Create an account at github.com and a new repository named `hrms-lite` (public or private).
2. In this folder, run:
   ```bash
   git init
   git add .
   git commit -m "Initial HRMS app"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/hrms-lite.git
   git push -u origin main
   ```

### Step 2: Supabase (database, for real data storage)
1. Create a project at supabase.com. Save the database password.
2. Open **SQL Editor** and run:
   ```sql
   create table employees (
     id uuid primary key default gen_random_uuid(),
     name text not null,
     email text not null,
     dept text not null,
     role text not null,
     salary numeric not null default 0,
     status text not null default 'Active'
   );
   create table attendance (
     id uuid primary key default gen_random_uuid(),
     emp_id uuid references employees(id) on delete cascade,
     date date not null,
     in_time text,
     out_time text
   );
   create table leaves (
     id uuid primary key default gen_random_uuid(),
     emp_id uuid references employees(id) on delete cascade,
     type text, from_date date, to_date date,
     reason text, status text default 'Pending'
   );
   ```
3. Go to **Project Settings → API** and copy the **Project URL** and **anon public key**.
4. Next step (to be added): replace the localStorage functions in `index.html` with Supabase calls using the URL and key from step 3. Never put the `service_role` key in front-end code.

### Step 3: Vercel (put the app online)
1. Sign in at vercel.com with GitHub.
2. Click **Add New → Project**, choose the `hrms-lite` repository, and click **Deploy**. No build settings are needed because it is a static site.
3. Vercel gives you a live URL like `https://hrms-lite.vercel.app`. Share this link in your presentation.
4. Every future `git push` redeploys automatically.

## Part 4: Presentation tips
- Demo flow: Dashboard → add an employee → check in → apply for leave → approve it → show payroll.
- Mention the tech stack: HTML, CSS, JavaScript (front end), Supabase (PostgreSQL database), GitHub (version control), Vercel (hosting).
