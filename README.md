# מעקב תזונה — Static Version

Single HTML file. No build step. Works offline (localStorage) and optionally syncs to Supabase.

---

## GitHub Pages deployment

```bash
git init
git add .
git commit -m "initial commit"
git remote add origin https://github.com/YOUR_USERNAME/calorie-tracker.git
git push -u origin main
```

Go to **Settings → Pages → Branch: main / root** → Save.
Your app will be live at `https://YOUR_USERNAME.github.io/calorie-tracker/`.

---

## Supabase integration (optional)

### 1. Create a Supabase project
Visit [supabase.com](https://supabase.com) and create a free project.

### 2. Run the SQL setup
Open **SQL Editor** in your Supabase dashboard and run the contents of `supabase-setup.sql`.

### 3. Add your credentials to index.html
Open `index.html` and find these two lines near the top of the `<script>` block:

```js
const SUPABASE_URL  = '';   // e.g. 'https://abcdef.supabase.co'
const SUPABASE_ANON = '';   // your anon/public key
```

Paste your **Project URL** and **anon public key** (from Supabase → Settings → API).

### 4. Done
- When credentials are present, the app syncs reads/writes to Supabase automatically.
- A small **"מחובר"** badge appears in the dashboard when connected.
- Without credentials the app works entirely from `localStorage` — no change to UX.

---

## Data schema in Supabase

All three tables use a simple `{ id: text, data: jsonb }` structure:

| Table      | id         | data                            |
|------------|------------|---------------------------------|
| `foods`    | food uuid  | full food object                |
| `meals`    | meal uuid  | full meal object with items[]   |
| `profiles` | `"user"`   | `{ profile: {...}, goals: {...} }` |

---

## Files

| File                  | Purpose                        |
|-----------------------|--------------------------------|
| `index.html`          | The entire app (HTML+CSS+JS)   |
| `supabase-setup.sql`  | SQL to create tables in Supabase |
| `README.md`           | This file                      |
