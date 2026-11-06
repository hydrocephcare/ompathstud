import { useMemo, useState } from "react";
import { Link } from "react-router-dom";
import { ArrowLeft, BookOpen, CheckCircle2, ChevronDown, Search } from "lucide-react";
import { Helmet } from "react-helmet-async";

type Course = { code: string; title: string; topics: string[] };
type Trimester = { name: string; courses: Course[] };

const OUTLINE: Trimester[] = [
  {
    name: "Trimester I",
    courses: [
      {
        code: "MBSG 4611",
        title: "Junior Clerkship in General Surgery I: Principles in Surgery",
        topics: [
          "Introduction to Surgery",
          "History Taking",
          "Physical Examination",
          "Surgical Incisions and Types of Suture Material",
          "Nutrition and Fluid Therapy",
          "Preoperative Care",
          "Postoperative Care / How to Assess the Postoperative Surgical Patient",
          "Care of the Critically Ill Patient",
          "Basic Surgical Skills and Anastomoses",
          "Anaemia and Blood Transfusion",
          "Surgical Site Infections",
          "Principles of Management in Neoplastic Conditions",
        ],
      },
      {
        code: "MBSG 4612",
        title: "Junior Clerkship in General Surgery II: Gastrointestinal Surgery — Small and Large Bowel",
        topics: [
          "Acute Abdomen",
          "Intestinal Obstruction",
          "Appendicitis",
          "Gastrointestinal Bleeding",
          "Diverticular Disease / Diverticulitis",
          "Gastrointestinal Endoscopy",
          "Introduction to Laparoscopic and Robotic Surgery",
          "Inflammatory Bowel Disease",
          "Benign Anorectal Conditions",
          "Abdominal Compartment Syndrome",
          "Colon and Rectal Cancer",
          "Stomas",
        ],
      },
    ],
  },
  {
    name: "Trimester II",
    courses: [
      {
        code: "MBSG 4624",
        title: "Junior Clerkship in General Surgery III: Upper GI, Hepatopancreatobiliary, Cardiothoracic and Vascular Surgery",
        topics: [
          "Dysphagia",
          "Oesophageal Injuries",
          "Gastro-oesophageal Reflux Disease",
          "Peptic Ulcer Disease",
          "Oesophageal Cancer",
          "Gastric Neoplasms",
          "History, Examination and Investigation of a Jaundiced Patient",
          "Cholelithiasis, Cholecystitis and Cholangitis",
          "Acute and Chronic Pancreatitis",
          "Chest Trauma",
          "Varicose Veins and Venous Ulcers",
          "Peripheral Arterial Disease",
        ],
      },
      {
        code: "MBSG 4625",
        title: "Junior Clerkship in General Surgery IV: Paediatric Surgery, Neurosurgery and Trauma",
        topics: [
          "Principles of Trauma Management",
          "Principles of Paediatric Surgery",
          "Oesophageal Atresia and Tracheo-oesophageal Fistula",
          "Infantile Hypertrophic Pyloric Stenosis",
          "Omphalocele and Gastroschisis",
          "Intussusception",
          "Hirschsprung Disease",
          "Anorectal Malformations",
          "Hydrocephalus",
          "Abdominal Trauma",
          "Traumatic Brain Injury",
          "Enterocutaneous and Enteroatmospheric Fistulae",
        ],
      },
    ],
  },
  {
    name: "Trimester III",
    courses: [
      {
        code: "MBSG 4637",
        title: "Junior Clerkship in General Surgery V: Urology and Plastic Surgery",
        topics: [
          "Wound Healing and Repair",
          "Burns Assessment and Management I",
          "Burns Assessment and Management II",
          "Principles of Wound Management",
          "Cleft Lip and Palate",
          "Abdominal Wall Hernias",
          "Melanoma and Non-melanoma Skin Cancers",
          "History and Physical Examination in Urology",
          "Haematuria",
          "Acute Scrotum",
          "Urethra and Penis",
          "Necrotising Fasciitis",
        ],
      },
      {
        code: "MBSG 4638",
        title: "Junior Clerkship in General Surgery VI: Breast and Endocrine Surgery",
        topics: [
          "History, Physical Examination and Assessment of the Breasts",
          "Benign Breast Diseases",
          "Breast Cancer",
          "History, Physical Examination and Assessment of an Anterior Neck Swelling",
          "Benign Thyroid Conditions",
          "Thyroid Cancer",
          "Parathyroid Disease — Surgical Management",
          "Adrenal Tumours — Investigation and Management",
          "Diabetic Foot",
          "Bariatric and Metabolic Surgery",
          "Lymphatic Disorders",
          "End-of-year Revision",
        ],
      },
    ],
  },
];

const CURRENT_TRIMESTER = "Trimester I";
const COURSE_RESOURCES: Record<string, { slug: string; label: string }> = {
  "Surgical Incisions and Types of Suture Material": {
    slug: "surgical-incisions-suture-materials-types-techniques",
    label: "Surgical Incisions and Suture Materials",
  },
  "Nutrition and Fluid Therapy": {
    slug: "nutrition-fluid-therapy-surgical-patients",
    label: "Nutrition and Fluid Therapy in Surgical Patients",
  },
  "Preoperative Care": {
    slug: "preoperative-care-assessment-risk-stratification-surgery",
    label: "Preoperative Care",
  },
  "Postoperative Care / How to Assess the Postoperative Surgical Patient": {
    slug: "postoperative-care-assessment-surgical-patient",
    label: "Postoperative Care and Assessment",
  },
};

const totalTopics = OUTLINE.reduce((sum, trimester) =>
  sum + trimester.courses.reduce((n, course) => n + course.topics.length, 0), 0);

export default function GeneralSurgeryCourseOutline() {
  const [query, setQuery] = useState("");
  const normalizedQuery = query.trim().toLowerCase();
  const filtered = useMemo(() => OUTLINE.map(trimester => ({
    ...trimester,
    courses: trimester.courses.map(course => ({
      ...course,
      topics: course.topics.filter((topic, index) =>
        !normalizedQuery ||
        topic.toLowerCase().includes(normalizedQuery) ||
        course.code.toLowerCase().includes(normalizedQuery) ||
        course.title.toLowerCase().includes(normalizedQuery) ||
        trimester.name.toLowerCase().includes(normalizedQuery)
      ),
    })).filter(course =>
      course.topics.length > 0 ||
      (!normalizedQuery && course.title.toLowerCase().includes(normalizedQuery))
    ),
  })).filter(trimester => trimester.courses.length > 0), [normalizedQuery]);

  const visibleCount = filtered.reduce((sum, trimester) =>
    sum + trimester.courses.reduce((n, course) => n + course.topics.length, 0), 0);

  return (
    <main className="mx-auto max-w-5xl px-4 py-7 sm:px-6 sm:py-10">
      <Helmet>
        <title>MBChB Year IV General Surgery Course Outline | OmpathStudy</title>
        <meta name="description" content="The MBChB IV MBSG 4600 General Surgery lecture outline, organised by trimester and course code: MBSG 4611, 4612, 4624, 4625, 4637 and 4638." />
        <meta property="og:title" content="MBChB Year IV — MBSG 4600 General Surgery Course Outline" />
        <meta property="og:description" content="Explore all six junior clerkship courses and 72 lecture topics across the three trimesters." />
      </Helmet>

      <Link to="/year/4" className="mb-5 inline-flex items-center gap-2 text-sm font-medium text-muted-foreground hover:text-primary">
        <ArrowLeft className="h-4 w-4" /> Back to Year 4
      </Link>

      <section className="overflow-hidden rounded-3xl border border-border bg-card">
        <div className="bg-gradient-to-br from-primary/10 via-card to-card px-5 py-7 sm:px-8 sm:py-9">
          <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.16em] text-primary">
            <BookOpen className="h-4 w-4" /> MBChB Year IV
          </div>
          <h1 className="mt-3 font-serif text-3xl font-bold leading-tight text-foreground sm:text-4xl">General Surgery Course Outline</h1>
          <p className="mt-2 max-w-3xl text-sm leading-6 text-muted-foreground sm:text-base">
            MBSG 4600 · Junior Clerkship in General Surgery · Lecture topics arranged according to the three-trimester teaching plan.
          </p>
          <div className="mt-6 grid grid-cols-3 gap-2 sm:max-w-xl sm:gap-3">
            {[
              { value: "3", label: "Trimesters" },
              { value: "6", label: "Course units" },
              { value: String(totalTopics), label: "Lecture topics" },
            ].map(item => (
              <div key={item.label} className="rounded-xl border border-border/70 bg-background/80 px-3 py-3">
                <p className="text-2xl font-bold tabular-nums text-foreground">{item.value}</p>
                <p className="mt-0.5 text-[11px] text-muted-foreground sm:text-xs">{item.label}</p>
              </div>
            ))}
          </div>
        </div>
        <div className="border-t border-border p-4 sm:p-6">
          <label htmlFor="outline-search" className="mb-2 block text-sm font-semibold text-foreground">Find a lecture topic</label>
          <div className="relative">
            <Search className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
            <input
              id="outline-search"
              value={query}
              onChange={event => setQuery(event.target.value)}
              placeholder="Search topics or course codes, e.g. appendicitis or MBSG 4612"
              className="w-full rounded-xl border border-input bg-background py-3 pl-10 pr-4 text-sm text-foreground outline-none transition focus:border-primary focus:ring-2 focus:ring-primary/15"
            />
          </div>
          <p className="mt-2 text-xs text-muted-foreground">{normalizedQuery ? `${visibleCount} matching topics` : `All ${totalTopics} lecture topics shown`}</p>
        </div>
      </section>

      <nav aria-label="Trimester navigation" className="mt-5 flex flex-wrap gap-2">
        {OUTLINE.map((trimester, index) => (
          <a key={trimester.name} href={`#trimester-${index + 1}`} className="rounded-full border border-border bg-card px-4 py-2 text-xs font-semibold text-muted-foreground transition hover:border-primary/50 hover:text-primary">
            {trimester.name}
          </a>
        ))}
      </nav>

      <div className="mt-5 space-y-6">
        {filtered.length === 0 && (
          <div className="rounded-2xl border border-dashed border-border bg-card px-5 py-12 text-center">
            <Search className="mx-auto h-7 w-7 text-muted-foreground" />
            <p className="mt-3 font-semibold text-foreground">No matching topics</p>
            <p className="mt-1 text-sm text-muted-foreground">Try a different topic name or course code.</p>
          </div>
        )}
        {filtered.map(trimester => {
          const originalIndex = OUTLINE.findIndex(item => item.name === trimester.name);
          const trimesterCount = trimester.courses.reduce((n, course) => n + course.topics.length, 0);
          return (
            <section id={`trimester-${originalIndex + 1}`} key={trimester.name} className="scroll-mt-24">
              <div className="mb-3 flex items-end justify-between gap-3">
                <div>
                  <p className="text-xs font-semibold uppercase tracking-[0.15em] text-primary">MBSG 4600</p>
                  <h2 className="mt-1 font-serif text-2xl font-bold text-foreground">{trimester.name}</h2>
                </div>
                <span className="rounded-full bg-muted px-3 py-1 text-xs font-medium text-muted-foreground">{trimesterCount} topics</span>
              </div>
              <div className="space-y-3">
                {trimester.courses.map(course => (
                  <details key={course.code} open={!!normalizedQuery} className="group overflow-hidden rounded-2xl border border-border bg-card">
                    <summary className="flex cursor-pointer list-none items-center gap-3 px-4 py-4 sm:px-5 [&::-webkit-details-marker]:hidden">
                      <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-primary/10 text-xs font-bold text-primary">{course.code.split(" ")[1].slice(-2)}</span>
                      <span className="min-w-0 flex-1">
                        <span className="block text-xs font-bold uppercase tracking-wide text-primary">{course.code}</span>
                        <span className="mt-0.5 block text-sm font-semibold leading-5 text-foreground sm:text-base">{course.title}</span>
                        <span className="mt-1 block text-xs text-muted-foreground">{course.topics.length} lecture topics</span>
                      </span>
                      <ChevronDown className="h-5 w-5 shrink-0 text-muted-foreground transition-transform group-open:rotate-180" />
                    </summary>
                    <div className="border-t border-border px-4 py-3 sm:px-5">
                      <ol className="space-y-1.5">
                        {course.topics.map((topic, index) => (
                          <li key={topic} className="flex items-start gap-3 rounded-lg px-2 py-2 text-sm leading-5 text-foreground transition hover:bg-muted/50">
                            <span className="mt-0.5 w-6 shrink-0 text-right text-xs font-semibold tabular-nums text-muted-foreground">{String(index + 1).padStart(2, "0")}</span>
                            <span className="min-w-0 flex-1">
                              {COURSE_RESOURCES[topic] ? (
                                <Link
                                  to={`/blog/${COURSE_RESOURCES[topic].slug}`}
                                  className="font-medium text-primary underline-offset-4 hover:underline"
                                >
                                  {topic}
                                </Link>
                              ) : topic}
                              {trimester.name === CURRENT_TRIMESTER && (
                                <span className="mt-1 block text-[10px] font-semibold uppercase tracking-wide text-muted-foreground">
                                  {COURSE_RESOURCES[topic] ? "Current trimester · Revision resource available" : "Current trimester · Resource not yet available"}
                                </span>
                              )}
                              {trimester.name !== CURRENT_TRIMESTER && (
                                <span className="mt-1 block text-[10px] text-muted-foreground">Upcoming trimester</span>
                              )}
                            </span>
                            {COURSE_RESOURCES[topic] ? (
                              <span className="mt-0.5 shrink-0 rounded-full bg-primary/10 px-2 py-1 text-[10px] font-semibold text-primary">Read note</span>
                            ) : (
                              <span className="mt-0.5 shrink-0 text-[10px] text-muted-foreground">Not published</span>
                            )}
                          </li>
                        ))}
                      </ol>
                    </div>
                  </details>
                ))}
              </div>
            </section>
          );
        })}
      </div>

      <div className="mt-8 rounded-2xl border border-border bg-muted/30 p-4 text-xs leading-5 text-muted-foreground sm:p-5">
        <strong className="text-foreground">Course outline note:</strong> This page organises the lecture topics supplied for MBChB IV, MBSG 4600. Topic wording has been lightly standardised for spelling and readability without intentionally changing the scope. Follow the latest departmental timetable and lecturer instructions where they differ.
      </div>
    </main>
  );
}
