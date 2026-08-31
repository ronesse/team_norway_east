create table if not exists public.tne_falkoping_travel (
  player_name text primary key,
  available_time time not null,
  departure_place text,
  comment text,
  updated_at timestamptz not null default now()
);

alter table public.tne_falkoping_travel enable row level security;

drop policy if exists "TNE travel public read" on public.tne_falkoping_travel;
create policy "TNE travel public read"
on public.tne_falkoping_travel
for select to anon
using (true);

drop policy if exists "TNE travel public insert" on public.tne_falkoping_travel;
create policy "TNE travel public insert"
on public.tne_falkoping_travel
for insert to anon
with check (true);

drop policy if exists "TNE travel public update" on public.tne_falkoping_travel;
create policy "TNE travel public update"
on public.tne_falkoping_travel
for update to anon
using (true)
with check (true);

grant select, insert, update on public.tne_falkoping_travel to anon;
