-- ============================================
-- Supabase setup for Calorie Tracker
-- Run this in the Supabase SQL Editor
-- ============================================

-- Foods table
create table if not exists foods (
  id   text primary key,
  data jsonb not null,
  created_at timestamptz default now()
);

-- Meals table
create table if not exists meals (
  id   text primary key,
  data jsonb not null,
  created_at timestamptz default now()
);

-- Profiles table (single-user: always id = 'user')
create table if not exists profiles (
  id   text primary key,
  data jsonb not null,
  updated_at timestamptz default now()
);

-- ── Enable Row Level Security (RLS) ──
alter table foods    enable row level security;
alter table meals    enable row level security;
alter table profiles enable row level security;

-- ── Public read/write policies (single-user app) ──
-- If you later add auth, replace these with user-scoped policies.

create policy "allow all on foods"    on foods    for all using (true) with check (true);
create policy "allow all on meals"    on meals    for all using (true) with check (true);
create policy "allow all on profiles" on profiles for all using (true) with check (true);
