-- Step 1: one table that stores the whole HRMS data set as JSON.
-- Simple on purpose: the app keeps working as it does today, but the data
-- lives online instead of in one browser. We move to proper tables later.

create table if not exists hrms_state (
  id text primary key,                    -- the app uses the single row 'main'
  data jsonb not null,                    -- employees, leaves, jobs, ... all in one object
  updated_at timestamptz not null default now()
);

alter table hrms_state enable row level security;

-- TEMPORARY: anyone with the anon key can read and write. Fine for a demo,
-- NOT for real employee data. Step 2 (login & roles) replaces these policies.
create policy "demo read"   on hrms_state for select using (true);
create policy "demo insert" on hrms_state for insert with check (true);
create policy "demo update" on hrms_state for update using (true);
