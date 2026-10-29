import { useLocation } from "react-router-dom";
import { ArrowRight, Gamepad2, Sparkles, Users } from "lucide-react";

/**
 * Homepage-only spotlight for Friend Zone. The navigation and footer links make
 * the feature discoverable throughout the rest of the site as well.
 */
export default function FriendZoneSpotlight() {
  const { pathname } = useLocation();

  if (pathname !== "/") return null;

  return (
    <section className="px-4 pt-4 sm:px-6 sm:pt-5" aria-label="Introducing Friend Zone">
      <div className="relative mx-auto max-w-6xl overflow-hidden rounded-2xl border border-violet-300/30 bg-gradient-to-r from-violet-950 via-indigo-950 to-slate-900 text-white shadow-lg shadow-violet-950/10">
        <div aria-hidden className="pointer-events-none absolute -right-12 -top-20 h-48 w-48 rounded-full bg-fuchsia-500/20 blur-3xl sm:h-64 sm:w-64" />
        <div aria-hidden className="pointer-events-none absolute -bottom-20 left-1/3 h-40 w-40 rounded-full bg-indigo-400/20 blur-3xl" />
        <div className="relative flex flex-col gap-4 p-5 sm:flex-row sm:items-center sm:justify-between sm:gap-6 sm:p-7">
          <div className="flex min-w-0 items-start gap-3 sm:gap-4">
            <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl border border-white/15 bg-white/10 shadow-inner sm:h-14 sm:w-14">
              <Gamepad2 className="h-6 w-6 text-fuchsia-200 sm:h-7 sm:w-7" />
            </div>
            <div className="min-w-0">
              <div className="mb-1.5 inline-flex items-center gap-1.5 rounded-full border border-fuchsia-200/20 bg-fuchsia-300/10 px-2.5 py-1 text-[10px] font-bold uppercase tracking-[0.15em] text-fuchsia-100 sm:text-[11px]">
                <Sparkles className="h-3 w-3" /> New on OmpathStudy
              </div>
              <h2 className="font-serif text-xl font-bold leading-tight sm:text-2xl">Meet your friends in Friend Zone</h2>
              <p className="mt-1.5 max-w-2xl text-sm leading-relaxed text-white/75 sm:text-[15px]">
                Turn revision into a shared challenge. Create questions, test your friends, and play along together.
              </p>
              <div className="mt-3 flex flex-wrap items-center gap-x-4 gap-y-1 text-xs font-medium text-white/65">
                <span className="inline-flex items-center gap-1.5"><Users className="h-3.5 w-3.5" /> Learn together</span>
                <span className="inline-flex items-center gap-1.5"><Gamepad2 className="h-3.5 w-3.5" /> Challenge each other</span>
              </div>
            </div>
          </div>
          <a
            href="https://www.ompathstudy.com/friend-zone"
            className="inline-flex min-h-11 shrink-0 items-center justify-center gap-2 rounded-xl bg-white px-5 py-3 text-sm font-bold text-indigo-950 shadow-md transition hover:-translate-y-0.5 hover:bg-fuchsia-50 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-offset-2 focus-visible:ring-offset-indigo-950 sm:min-w-[165px]"
          >
            Explore Friend Zone <ArrowRight className="h-4 w-4" />
          </a>
        </div>
      </div>
    </section>
  );
}
