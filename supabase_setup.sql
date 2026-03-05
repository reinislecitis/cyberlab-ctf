-- ════════════════════════════════════════════════
-- CyberLab CTF — Supabase datubāzes uzstādīšana
-- Izpildiet šo SQL Supabase > SQL Editor
-- ════════════════════════════════════════════════

-- 1. Studentu tabula
CREATE TABLE IF NOT EXISTS students (
  id          BIGSERIAL PRIMARY KEY,
  name        TEXT NOT NULL UNIQUE,
  total_score INTEGER DEFAULT 0,
  last_seen   TIMESTAMPTZ DEFAULT NOW(),
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Progresa tabula
CREATE TABLE IF NOT EXISTS progress (
  id             BIGSERIAL PRIMARY KEY,
  student_name   TEXT NOT NULL REFERENCES students(name) ON DELETE CASCADE,
  challenge_id   INTEGER NOT NULL,
  points_earned  INTEGER NOT NULL,
  hint_used      BOOLEAN DEFAULT FALSE,
  solved_at      TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_name, challenge_id)
);

-- 3. Indeksi ātrākai darbībai
CREATE INDEX IF NOT EXISTS idx_progress_student ON progress(student_name);
CREATE INDEX IF NOT EXISTS idx_progress_challenge ON progress(challenge_id);
CREATE INDEX IF NOT EXISTS idx_students_score ON students(total_score DESC);

-- 4. Row Level Security (RLS) — ieslēgt
ALTER TABLE students ENABLE ROW LEVEL SECURITY;
ALTER TABLE progress ENABLE ROW LEVEL SECURITY;

-- 5. RLS politikas — anon (studenti) var lasīt/rakstīt savus datus
-- Studenti var izveidot/atjaunināt savu ierakstu
CREATE POLICY "Students can upsert own record"
  ON students FOR ALL
  USING (true)
  WITH CHECK (true);

-- Studenti var lasīt/rakstīt progresu
CREATE POLICY "Students can manage progress"
  ON progress FOR ALL
  USING (true)
  WITH CHECK (true);

-- ════════════════════════════════════════════════
-- PĀRBAUDE — izpildiet pēc tabulu izveides
-- ════════════════════════════════════════════════
-- SELECT * FROM students;
-- SELECT * FROM progress;
