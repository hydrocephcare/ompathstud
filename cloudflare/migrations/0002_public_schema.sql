CREATE TABLE IF NOT EXISTS "articles" (
  "id" TEXT,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL DEFAULT '',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "published" INTEGER NOT NULL DEFAULT 0,
  "original_notes" TEXT NOT NULL DEFAULT '',
  "category" TEXT NOT NULL DEFAULT 'Uncategorized',
  "deleted_at" TEXT,
  "meta_title" TEXT DEFAULT '',
  "meta_description" TEXT DEFAULT '',
  "og_image_url" TEXT DEFAULT '',
  "slug" TEXT DEFAULT '',
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "countdown" TEXT,
  "html_embed" TEXT,
  "password_protected" INTEGER NOT NULL DEFAULT 0,
  "access_password" TEXT,
  "scheduled_at" TEXT,
  "tags" TEXT NOT NULL DEFAULT '[]',
  "featured_image" TEXT,
  "reading_time_minutes" INTEGER,
  "toc_enabled" INTEGER NOT NULL DEFAULT 0,
  "comments_enabled" INTEGER NOT NULL DEFAULT 1,
  "university" TEXT,
  "school" TEXT,
  "lecturer" TEXT,
  "exam_type" TEXT,
  "exam_year" TEXT,
  "unit" TEXT,
  "content_kind" TEXT,
  "is_raw" INTEGER,
  "unit_id" TEXT,
  "semester_number" INTEGER,
  "verification_status" TEXT NOT NULL DEFAULT 'imported',
  "completeness_status" TEXT NOT NULL DEFAULT 'unknown',
  "reviewed_by" TEXT,
  "reviewed_at" TEXT,
  "source_type" TEXT,
  "source_reference" TEXT,
  "confidence_score" REAL,
  "contains_answer_key" INTEGER NOT NULL DEFAULT 0,
  "answer_key_verified" INTEGER NOT NULL DEFAULT 0,
  "requires_review" INTEGER NOT NULL DEFAULT 0,
  "content_type" TEXT,
  "vimeo_video" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "flashcard_sets" (
  "id" TEXT,
  "title" TEXT NOT NULL,
  "cards" TEXT NOT NULL DEFAULT '[]',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "published" INTEGER NOT NULL DEFAULT 0,
  "original_notes" TEXT NOT NULL DEFAULT '',
  "category" TEXT NOT NULL DEFAULT 'Uncategorized',
  "deleted_at" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "meta_title" TEXT DEFAULT '',
  "meta_description" TEXT DEFAULT '',
  "og_image_url" TEXT DEFAULT '',
  "slug" TEXT DEFAULT '',
  "countdown" TEXT,
  "html_embed" TEXT,
  "password_protected" INTEGER NOT NULL DEFAULT 0,
  "access_password" TEXT,
  "scheduled_at" TEXT,
  "tags" TEXT NOT NULL DEFAULT '[]',
  "featured_image" TEXT,
  "reading_time_minutes" INTEGER,
  "toc_enabled" INTEGER NOT NULL DEFAULT 0,
  "comments_enabled" INTEGER NOT NULL DEFAULT 1,
  "is_raw" INTEGER,
  "unit_id" TEXT,
  "verification_status" TEXT NOT NULL DEFAULT 'imported',
  "completeness_status" TEXT NOT NULL DEFAULT 'unknown',
  "reviewed_by" TEXT,
  "reviewed_at" TEXT,
  "source_type" TEXT,
  "source_reference" TEXT,
  "confidence_score" REAL,
  "contains_answer_key" INTEGER NOT NULL DEFAULT 0,
  "answer_key_verified" INTEGER NOT NULL DEFAULT 0,
  "requires_review" INTEGER NOT NULL DEFAULT 0,
  "content_type" TEXT,
  "owner_id" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "mcq_sets" (
  "id" TEXT,
  "title" TEXT NOT NULL,
  "questions" TEXT NOT NULL DEFAULT '[]',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "published" INTEGER NOT NULL DEFAULT 0,
  "original_notes" TEXT NOT NULL DEFAULT '',
  "category" TEXT NOT NULL DEFAULT 'Uncategorized',
  "access_password" TEXT NOT NULL DEFAULT '',
  "deleted_at" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "meta_title" TEXT DEFAULT '',
  "meta_description" TEXT DEFAULT '',
  "og_image_url" TEXT DEFAULT '',
  "slug" TEXT DEFAULT '',
  "countdown" TEXT,
  "html_embed" TEXT,
  "password_protected" INTEGER NOT NULL DEFAULT 0,
  "scheduled_at" TEXT,
  "tags" TEXT NOT NULL DEFAULT '[]',
  "featured_image" TEXT,
  "reading_time_minutes" INTEGER,
  "toc_enabled" INTEGER NOT NULL DEFAULT 0,
  "comments_enabled" INTEGER NOT NULL DEFAULT 1,
  "university" TEXT,
  "school" TEXT,
  "lecturer" TEXT,
  "exam_type" TEXT,
  "exam_year" TEXT,
  "unit" TEXT,
  "is_raw" INTEGER,
  "unit_id" TEXT,
  "semester_number" INTEGER,
  "verification_status" TEXT NOT NULL DEFAULT 'imported',
  "completeness_status" TEXT NOT NULL DEFAULT 'unknown',
  "reviewed_by" TEXT,
  "reviewed_at" TEXT,
  "source_type" TEXT,
  "source_reference" TEXT,
  "confidence_score" REAL,
  "contains_answer_key" INTEGER NOT NULL DEFAULT 0,
  "answer_key_verified" INTEGER NOT NULL DEFAULT 0,
  "requires_review" INTEGER NOT NULL DEFAULT 0,
  "content_type" TEXT,
  "vimeo_video" TEXT,
  "owner_id" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "app_settings" (
  "id" TEXT,
  "key" TEXT NOT NULL,
  "value" TEXT NOT NULL DEFAULT '',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "profiles" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "display_name" TEXT DEFAULT '',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "university" TEXT,
  "course" TEXT,
  "study_year" INTEGER,
  "onboarding_completed" INTEGER NOT NULL DEFAULT 0,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_roles" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "role" TEXT NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_answers" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "mcq_set_id" TEXT NOT NULL,
  "question_index" INTEGER NOT NULL,
  "question_text" TEXT NOT NULL DEFAULT '',
  "selected_answer" INTEGER NOT NULL,
  "correct_answer" INTEGER NOT NULL,
  "is_correct" INTEGER NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("mcq_set_id") REFERENCES "mcq_sets" ("id")
);

CREATE TABLE IF NOT EXISTS "payments" (
  "id" TEXT,
  "phone_number" TEXT NOT NULL,
  "amount" REAL NOT NULL DEFAULT 0,
  "payment_status" TEXT NOT NULL DEFAULT 'pending',
  "transaction_id" TEXT,
  "mpesa_code" TEXT,
  "buyer_name" TEXT,
  "buyer_email" TEXT,
  "package_type" TEXT DEFAULT 'exam',
  "project_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "provider_txn_id" TEXT,
  "user_id" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "essays" (
  "id" TEXT,
  "article_id" TEXT,
  "title" TEXT NOT NULL,
  "category" TEXT NOT NULL DEFAULT 'Uncategorized',
  "short_answer_questions" TEXT NOT NULL DEFAULT '[]',
  "long_answer_questions" TEXT NOT NULL DEFAULT '[]',
  "published" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "meta_title" TEXT DEFAULT '',
  "meta_description" TEXT DEFAULT '',
  "og_image_url" TEXT DEFAULT '',
  "slug" TEXT DEFAULT '',
  PRIMARY KEY ("id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "exam_results" (
  "id" TEXT,
  "exam_id" TEXT NOT NULL,
  "exam_title" TEXT NOT NULL DEFAULT '',
  "unit" TEXT NOT NULL DEFAULT 'General',
  "student_name" TEXT NOT NULL DEFAULT '',
  "university" TEXT NOT NULL DEFAULT '',
  "course" TEXT NOT NULL DEFAULT '',
  "mcq_score" INTEGER NOT NULL DEFAULT 0,
  "mcq_total" INTEGER NOT NULL DEFAULT 0,
  "saq_answers" TEXT NOT NULL DEFAULT '[]',
  "laq_answers" TEXT NOT NULL DEFAULT '[]',
  "time_taken_seconds" INTEGER NOT NULL DEFAULT 0,
  "submitted_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "stories" (
  "id" TEXT,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL DEFAULT '',
  "category" TEXT NOT NULL DEFAULT 'Uncategorized',
  "published" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" TEXT,
  "cover_image_url" TEXT,
  "meta_title" TEXT DEFAULT '',
  "meta_description" TEXT DEFAULT '',
  "og_image_url" TEXT DEFAULT '',
  "slug" TEXT DEFAULT '',
  "countdown" TEXT,
  "html_embed" TEXT,
  "password_protected" INTEGER NOT NULL DEFAULT 0,
  "access_password" TEXT,
  "scheduled_at" TEXT,
  "tags" TEXT NOT NULL DEFAULT '[]',
  "featured_image" TEXT,
  "reading_time_minutes" INTEGER,
  "toc_enabled" INTEGER NOT NULL DEFAULT 0,
  "comments_enabled" INTEGER NOT NULL DEFAULT 1,
  "vimeo_video" TEXT,
  "submitted_by" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "article_categories" (
  "id" TEXT,
  "name" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "article_comments" (
  "id" TEXT,
  "article_id" TEXT NOT NULL,
  "author_name" TEXT NOT NULL DEFAULT 'Anonymous',
  "body" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "parent_id" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("parent_id") REFERENCES "article_comments" ("id")
);

CREATE TABLE IF NOT EXISTS "pending_institutions" (
  "id" TEXT,
  "type" TEXT NOT NULL,
  "value" TEXT NOT NULL,
  "submitted_by" TEXT,
  "submitted_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "reviewed_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "slide_corrections" (
  "id" TEXT,
  "article_id" TEXT NOT NULL,
  "slide_number" TEXT NOT NULL,
  "slide_prompt" TEXT,
  "suggestion" TEXT NOT NULL,
  "submitter_name" TEXT,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "admin_note" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "access_grants" (
  "id" TEXT,
  "code" TEXT NOT NULL,
  "plan" TEXT NOT NULL DEFAULT 'day',
  "scope" TEXT NOT NULL DEFAULT 'all',
  "expires_at" TEXT NOT NULL,
  "payment_id" TEXT,
  "phone_number" TEXT,
  "amount" REAL DEFAULT 0,
  "allow_download" INTEGER NOT NULL DEFAULT 1,
  "redeem_count" INTEGER NOT NULL DEFAULT 0,
  "last_redeemed_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "user_id" TEXT,
  "email" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("payment_id") REFERENCES "payments" ("id")
);

CREATE TABLE IF NOT EXISTS "academic_years" (
  "id" TEXT,
  "year_number" INTEGER NOT NULL,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "display_order" INTEGER NOT NULL DEFAULT 0,
  "published" INTEGER NOT NULL DEFAULT 1,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "semesters" (
  "id" TEXT,
  "academic_year_id" TEXT NOT NULL,
  "semester_number" INTEGER NOT NULL,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "display_order" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("academic_year_id") REFERENCES "academic_years" ("id")
);

CREATE TABLE IF NOT EXISTS "units" (
  "id" TEXT,
  "academic_year_id" TEXT NOT NULL,
  "semester_id" TEXT,
  "name" TEXT NOT NULL,
  "slug" TEXT NOT NULL,
  "short_name" TEXT,
  "course_code" TEXT,
  "description" TEXT,
  "learning_objectives" TEXT,
  "exam_information" TEXT,
  "legacy_category" TEXT,
  "display_order" INTEGER NOT NULL DEFAULT 0,
  "published" INTEGER NOT NULL DEFAULT 1,
  "icon" TEXT,
  "color" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("academic_year_id") REFERENCES "academic_years" ("id"),
  FOREIGN KEY ("semester_id") REFERENCES "semesters" ("id")
);

CREATE TABLE IF NOT EXISTS "syllabus_topics" (
  "id" TEXT,
  "unit_id" TEXT NOT NULL,
  "parent_topic_id" TEXT,
  "title" TEXT NOT NULL,
  "slug" TEXT,
  "description" TEXT,
  "learning_objectives" TEXT,
  "display_order" INTEGER NOT NULL DEFAULT 0,
  "importance" TEXT NOT NULL DEFAULT 'core',
  "published" INTEGER NOT NULL DEFAULT 1,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id"),
  FOREIGN KEY ("parent_topic_id") REFERENCES "syllabus_topics" ("id")
);

CREATE TABLE IF NOT EXISTS "resource_topics" (
  "id" TEXT,
  "resource_type" TEXT NOT NULL,
  "resource_id" TEXT NOT NULL,
  "topic_id" TEXT NOT NULL,
  "relationship_type" TEXT NOT NULL DEFAULT 'primary',
  "relevance_score" REAL NOT NULL DEFAULT 0.5,
  "approved" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("topic_id") REFERENCES "syllabus_topics" ("id")
);

CREATE TABLE IF NOT EXISTS "user_resource_progress" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "resource_type" TEXT NOT NULL,
  "resource_id" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'in_progress',
  "progress_percent" INTEGER NOT NULL DEFAULT 0,
  "last_position" TEXT,
  "first_opened_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "last_opened_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "completed_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_bookmarks" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "resource_type" TEXT NOT NULL,
  "resource_id" TEXT NOT NULL,
  "collection_name" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_topic_progress" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "topic_id" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'not_started',
  "confidence_level" INTEGER NOT NULL DEFAULT 0,
  "correct_answers" INTEGER NOT NULL DEFAULT 0,
  "attempted_questions" INTEGER NOT NULL DEFAULT 0,
  "last_studied_at" TEXT,
  "completed_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("topic_id") REFERENCES "syllabus_topics" ("id")
);

CREATE TABLE IF NOT EXISTS "user_study_activity" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "activity_type" TEXT NOT NULL,
  "resource_type" TEXT,
  "resource_id" TEXT,
  "unit_id" TEXT,
  "topic_id" TEXT,
  "duration_seconds" INTEGER NOT NULL DEFAULT 0,
  "score" REAL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("topic_id") REFERENCES "syllabus_topics" ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "exam_attempts" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "exam_id" TEXT NOT NULL,
  "started_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "submitted_at" TEXT,
  "score" REAL,
  "maximum_score" REAL,
  "percentage" REAL,
  "duration_seconds" INTEGER,
  "completed" INTEGER NOT NULL DEFAULT 0,
  "answers" TEXT NOT NULL DEFAULT '[]',
  "topic_breakdown" TEXT NOT NULL DEFAULT '{}',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "revision_plans" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "academic_year_id" TEXT,
  "unit_ids" TEXT NOT NULL,
  "exam_date" TEXT,
  "study_days" INTEGER,
  "daily_minutes" INTEGER,
  "rest_days" TEXT NOT NULL,
  "confidence_level" INTEGER,
  "activity_types" TEXT NOT NULL DEFAULT '[]',
  "active" INTEGER NOT NULL DEFAULT 1,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("academic_year_id") REFERENCES "academic_years" ("id")
);

CREATE TABLE IF NOT EXISTS "revision_plan_items" (
  "id" TEXT,
  "plan_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "scheduled_date" TEXT NOT NULL,
  "unit_id" TEXT,
  "topic_id" TEXT,
  "resource_type" TEXT,
  "resource_id" TEXT,
  "resource_title" TEXT,
  "activity" TEXT NOT NULL DEFAULT 'read',
  "estimated_minutes" INTEGER NOT NULL DEFAULT 30,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "display_order" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("plan_id") REFERENCES "revision_plans" ("id"),
  FOREIGN KEY ("topic_id") REFERENCES "syllabus_topics" ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "search_aliases" (
  "id" TEXT,
  "canonical_term" TEXT NOT NULL,
  "alias" TEXT NOT NULL,
  "topic_id" TEXT,
  "unit_id" TEXT,
  "priority" INTEGER NOT NULL DEFAULT 0,
  "approved" INTEGER NOT NULL DEFAULT 1,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id"),
  FOREIGN KEY ("topic_id") REFERENCES "syllabus_topics" ("id")
);

CREATE TABLE IF NOT EXISTS "medical_concepts" (
  "id" TEXT,
  "canonical_term" TEXT NOT NULL,
  "definition" TEXT,
  "preferred_article_id" TEXT,
  "preferred_topic_id" TEXT,
  "unit_id" TEXT,
  "importance" INTEGER NOT NULL DEFAULT 1,
  "enabled" INTEGER NOT NULL DEFAULT 1,
  "approved" INTEGER NOT NULL DEFAULT 0,
  "click_count" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("preferred_article_id") REFERENCES "articles" ("id"),
  FOREIGN KEY ("preferred_topic_id") REFERENCES "syllabus_topics" ("id"),
  FOREIGN KEY ("unit_id") REFERENCES "units" ("id")
);

CREATE TABLE IF NOT EXISTS "medical_concept_aliases" (
  "id" TEXT,
  "concept_id" TEXT NOT NULL,
  "alias" TEXT NOT NULL,
  "abbreviation" INTEGER NOT NULL DEFAULT 0,
  "spelling_variant" INTEGER NOT NULL DEFAULT 0,
  "approved" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("concept_id") REFERENCES "medical_concepts" ("id")
);

CREATE TABLE IF NOT EXISTS "concept_relationships" (
  "id" TEXT,
  "source_concept_id" TEXT NOT NULL,
  "target_concept_id" TEXT NOT NULL,
  "relationship_type" TEXT NOT NULL DEFAULT 'related',
  "relevance_score" REAL NOT NULL DEFAULT 0.5,
  "approved" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("target_concept_id") REFERENCES "medical_concepts" ("id"),
  FOREIGN KEY ("source_concept_id") REFERENCES "medical_concepts" ("id")
);

CREATE TABLE IF NOT EXISTS "concept_link_clicks" (
  "id" TEXT,
  "concept_id" TEXT,
  "from_resource_type" TEXT,
  "from_resource_id" TEXT,
  "to_article_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("concept_id") REFERENCES "medical_concepts" ("id")
);

CREATE TABLE IF NOT EXISTS "search_queries" (
  "id" TEXT,
  "query" TEXT NOT NULL,
  "normalized_query" TEXT,
  "results_count" INTEGER NOT NULL DEFAULT 0,
  "clicked_resource_type" TEXT,
  "clicked_resource_id" TEXT,
  "user_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "content_reports" (
  "id" TEXT,
  "user_id" TEXT,
  "resource_type" TEXT NOT NULL,
  "resource_id" TEXT NOT NULL,
  "resource_url" TEXT,
  "section_anchor" TEXT,
  "selected_text" TEXT,
  "report_type" TEXT NOT NULL,
  "message" TEXT,
  "status" TEXT NOT NULL DEFAULT 'open',
  "assigned_admin_id" TEXT,
  "resolution_notes" TEXT,
  "device_info" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "resolved_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "resource_feedback" (
  "id" TEXT,
  "resource_type" TEXT NOT NULL,
  "resource_id" TEXT NOT NULL,
  "vote" TEXT NOT NULL,
  "user_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "article_answer_attempts" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "article_id" TEXT NOT NULL,
  "question_key" TEXT NOT NULL,
  "question_text" TEXT NOT NULL DEFAULT '',
  "topic_label" TEXT,
  "category" TEXT,
  "selected_answer" TEXT NOT NULL,
  "correct_answer" TEXT NOT NULL,
  "is_correct" INTEGER NOT NULL,
  "attempted_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "notification_campaigns" (
  "id" TEXT,
  "title" TEXT NOT NULL,
  "message" TEXT NOT NULL,
  "action_url" TEXT,
  "audience" TEXT NOT NULL DEFAULT 'all_users',
  "study_year" INTEGER,
  "status" TEXT NOT NULL DEFAULT 'draft',
  "recipient_count" INTEGER NOT NULL DEFAULT 0,
  "delivered_count" INTEGER NOT NULL DEFAULT 0,
  "failed_count" INTEGER NOT NULL DEFAULT 0,
  "created_by" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "sent_at" TEXT,
  "type" TEXT DEFAULT 'general',
  "priority" TEXT DEFAULT 'normal',
  "expires_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "user_notifications" (
  "id" TEXT,
  "campaign_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "message" TEXT NOT NULL,
  "action_url" TEXT,
  "read_at" TEXT,
  "email_status" TEXT NOT NULL DEFAULT 'pending',
  "email_error" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "type" TEXT DEFAULT 'general',
  "priority" TEXT DEFAULT 'normal',
  "study_year" INTEGER,
  "expires_at" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("campaign_id") REFERENCES "notification_campaigns" ("id")
);

CREATE TABLE IF NOT EXISTS "notification_preferences" (
  "user_id" TEXT,
  "email_enabled" INTEGER NOT NULL DEFAULT 1,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id")
);

CREATE TABLE IF NOT EXISTS "contest_universities" (
  "id" TEXT,
  "name" TEXT NOT NULL,
  "slug" TEXT NOT NULL,
  "abbreviation" TEXT,
  "active" INTEGER NOT NULL DEFAULT 1,
  "verified" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "proposed_by" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "contests" (
  "id" TEXT,
  "slug" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "subtitle" TEXT NOT NULL DEFAULT '',
  "status" TEXT NOT NULL DEFAULT 'concept',
  "subjects" TEXT NOT NULL DEFAULT '[]',
  "eligible_years" TEXT NOT NULL,
  "competition_format" TEXT NOT NULL DEFAULT '',
  "registration_opens_at" TEXT,
  "registration_closes_at" TEXT,
  "starts_at" TEXT,
  "published" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "share_image_url" TEXT,
  "max_participants_per_university" INTEGER NOT NULL DEFAULT 50,
  "university_ids" TEXT NOT NULL,
  "auto_verify" INTEGER NOT NULL DEFAULT 1,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "contest_registrations" (
  "id" TEXT,
  "contest_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "university_id" TEXT NOT NULL,
  "study_year" INTEGER NOT NULL,
  "representation" TEXT NOT NULL DEFAULT 'individual',
  "status" TEXT NOT NULL DEFAULT 'pending',
  "accepted_rules_at" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "team_name" TEXT,
  "team_role" TEXT NOT NULL DEFAULT 'member',
  PRIMARY KEY ("id"),
  FOREIGN KEY ("contest_id") REFERENCES "contests" ("id"),
  FOREIGN KEY ("university_id") REFERENCES "contest_universities" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_rounds" (
  "id" TEXT,
  "contest_id" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "round_number" INTEGER NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'scheduled',
  "starts_at" TEXT,
  "ends_at" TEXT,
  "duration_seconds" INTEGER NOT NULL DEFAULT 1800,
  "question_count" INTEGER NOT NULL DEFAULT 0,
  "advancement_count" INTEGER,
  "locked_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "tab_switch_limit" INTEGER NOT NULL DEFAULT 2,
  "focus_loss_limit" INTEGER NOT NULL DEFAULT 3,
  "auto_eliminate" INTEGER NOT NULL DEFAULT 0,
  "integrity_policy" TEXT NOT NULL DEFAULT 'Integrity events are logged and reviewed by a moderator. Automatic elimination is used only when explicitly enabled for the round.',
  "source_mcq_set_id" TEXT,
  "source_exam_title" TEXT,
  "auto_open" INTEGER NOT NULL DEFAULT 1,
  "auto_close" INTEGER NOT NULL DEFAULT 1,
  "entry_grace_minutes" INTEGER NOT NULL DEFAULT 10,
  "results_visible" INTEGER NOT NULL DEFAULT 0,
  "university_a_id" TEXT,
  "university_b_id" TEXT,
  "shuffle_questions" INTEGER NOT NULL DEFAULT 1,
  "marks_correct" REAL NOT NULL DEFAULT 1,
  "marks_incorrect" REAL NOT NULL DEFAULT 0,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("source_mcq_set_id") REFERENCES "mcq_sets" ("id"),
  FOREIGN KEY ("university_a_id") REFERENCES "contest_universities" ("id"),
  FOREIGN KEY ("university_b_id") REFERENCES "contest_universities" ("id"),
  FOREIGN KEY ("contest_id") REFERENCES "contests" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_questions" (
  "id" TEXT,
  "round_id" TEXT NOT NULL,
  "position" INTEGER NOT NULL,
  "stem" TEXT NOT NULL,
  "options" TEXT NOT NULL,
  "snapshot_hash" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("round_id") REFERENCES "contest_rounds" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_attempts" (
  "id" TEXT,
  "round_id" TEXT NOT NULL,
  "registration_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'active',
  "started_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "submitted_at" TEXT,
  "eliminated_at" TEXT,
  "score" REAL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("registration_id") REFERENCES "contest_registrations" ("id"),
  FOREIGN KEY ("round_id") REFERENCES "contest_rounds" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_answers" (
  "id" TEXT,
  "attempt_id" TEXT NOT NULL,
  "question_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "selected_index" INTEGER NOT NULL,
  "response_ms" INTEGER,
  "submitted_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("question_id") REFERENCES "contest_questions" ("id"),
  FOREIGN KEY ("attempt_id") REFERENCES "contest_attempts" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_integrity_events" (
  "id" TEXT,
  "attempt_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "event_type" TEXT NOT NULL,
  "metadata" TEXT NOT NULL DEFAULT '{}',
  "occurred_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("attempt_id") REFERENCES "contest_attempts" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_university_results" (
  "id" TEXT,
  "contest_id" TEXT NOT NULL,
  "round_id" TEXT NOT NULL,
  "university_id" TEXT NOT NULL,
  "rank" INTEGER NOT NULL,
  "participant_count" INTEGER NOT NULL,
  "average_score" REAL NOT NULL,
  "total_points" REAL NOT NULL,
  "published" INTEGER NOT NULL DEFAULT 0,
  "published_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("university_id") REFERENCES "contest_universities" ("id"),
  FOREIGN KEY ("round_id") REFERENCES "contest_rounds" ("id"),
  FOREIGN KEY ("contest_id") REFERENCES "contests" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_advancements" (
  "id" TEXT,
  "contest_id" TEXT NOT NULL,
  "registration_id" TEXT NOT NULL,
  "source_round_id" TEXT NOT NULL,
  "target_round_id" TEXT,
  "decision" TEXT NOT NULL,
  "reason" TEXT NOT NULL,
  "decided_by" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("target_round_id") REFERENCES "contest_rounds" ("id"),
  FOREIGN KEY ("contest_id") REFERENCES "contests" ("id"),
  FOREIGN KEY ("registration_id") REFERENCES "contest_registrations" ("id"),
  FOREIGN KEY ("source_round_id") REFERENCES "contest_rounds" ("id")
);

CREATE TABLE IF NOT EXISTS "contest_moderator_actions" (
  "id" TEXT,
  "actor_id" TEXT NOT NULL,
  "action_type" TEXT NOT NULL,
  "target_type" TEXT NOT NULL,
  "target_id" TEXT NOT NULL,
  "reason" TEXT NOT NULL,
  "before_state" TEXT NOT NULL DEFAULT '{}',
  "after_state" TEXT NOT NULL DEFAULT '{}',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "contest_appeals" (
  "id" TEXT,
  "contest_id" TEXT NOT NULL,
  "registration_id" TEXT NOT NULL,
  "attempt_id" TEXT,
  "advancement_id" TEXT,
  "user_id" TEXT NOT NULL,
  "category" TEXT NOT NULL,
  "statement" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'open',
  "resolution" TEXT,
  "resolved_by" TEXT,
  "resolved_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("advancement_id") REFERENCES "contest_advancements" ("id"),
  FOREIGN KEY ("attempt_id") REFERENCES "contest_attempts" ("id"),
  FOREIGN KEY ("registration_id") REFERENCES "contest_registrations" ("id"),
  FOREIGN KEY ("contest_id") REFERENCES "contests" ("id")
);

CREATE TABLE IF NOT EXISTS "student_access" (
  "user_id" TEXT,
  "email" TEXT,
  "admission_no" TEXT,
  "entered_text" TEXT,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "method" TEXT NOT NULL DEFAULT 'format',
  "note" TEXT,
  "admin_seen" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "reviewed_at" TEXT,
  "reviewed_by" TEXT,
  PRIMARY KEY ("user_id")
);

CREATE TABLE IF NOT EXISTS "ai_answer_cache" (
  "cache_key" TEXT,
  "question" TEXT NOT NULL,
  "answer" TEXT NOT NULL,
  "grounded" INTEGER NOT NULL DEFAULT 1,
  "uses" INTEGER NOT NULL DEFAULT 0,
  "reports" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "last_used" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("cache_key")
);

CREATE TABLE IF NOT EXISTS "ai_user_history" (
  "user_id" TEXT,
  "data" TEXT NOT NULL DEFAULT '{}',
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id")
);

CREATE TABLE IF NOT EXISTS "ai_failures" (
  "id" TEXT,
  "kind" TEXT NOT NULL DEFAULT 'answer',
  "question" TEXT,
  "message" TEXT,
  "fallback" TEXT,
  "page" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "topic_pages" (
  "slug" TEXT,
  "name" TEXT NOT NULL,
  "category" TEXT,
  "status" TEXT NOT NULL DEFAULT 'generating',
  "content" TEXT,
  "model" TEXT,
  "reviewed" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "generator_model" TEXT,
  "ai_review_status" TEXT,
  "ai_review_model" TEXT,
  "ai_reviewed_at" TEXT,
  "ai_review_fix_rounds" INTEGER,
  PRIMARY KEY ("slug")
);

CREATE TABLE IF NOT EXISTS "site_visits" (
  "id" INTEGER,
  "at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "day" TEXT NOT NULL,
  "visitor" TEXT NOT NULL,
  "member" INTEGER NOT NULL DEFAULT 0,
  "path" TEXT NOT NULL,
  "device" TEXT,
  "ref" TEXT,
  "machine" TEXT,
  "is_admin" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "site_presence" (
  "visitor" TEXT,
  "member" INTEGER NOT NULL DEFAULT 0,
  "path" TEXT,
  "device" TEXT,
  "last_seen" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "is_admin" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("visitor")
);

CREATE TABLE IF NOT EXISTS "blog_polish" (
  "article_id" TEXT,
  "status" TEXT NOT NULL DEFAULT 'working',
  "title" TEXT,
  "description" TEXT,
  "content" TEXT,
  "image_query" TEXT,
  "verdict" TEXT,
  "reason" TEXT,
  "model" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "parts_done" INTEGER NOT NULL DEFAULT 0,
  "ai_review_status" TEXT,
  "ai_review_model" TEXT,
  "ai_reviewed_at" TEXT,
  "ai_review_issues" TEXT NOT NULL DEFAULT '[]',
  PRIMARY KEY ("article_id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "polish_secret" (
  "id" INTEGER DEFAULT 1,
  "secret" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "ai_drafts" (
  "id" TEXT,
  "query" TEXT NOT NULL,
  "query_key" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "year" INTEGER,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "asked" INTEGER NOT NULL DEFAULT 1,
  "article_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "decided_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "note_comments" (
  "id" TEXT,
  "note_slug" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "author" TEXT NOT NULL DEFAULT 'Student',
  "body" TEXT NOT NULL,
  "hidden" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "note_progress" (
  "user_id" TEXT,
  "note_slug" TEXT,
  "progress" INTEGER NOT NULL DEFAULT 0,
  "finished" INTEGER NOT NULL DEFAULT 0,
  "review_stage" INTEGER NOT NULL DEFAULT 0,
  "review_due" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "note_slug")
);

CREATE TABLE IF NOT EXISTS "admission_rules" (
  "id" TEXT,
  "label" TEXT NOT NULL,
  "pattern" TEXT NOT NULL,
  "replacement" TEXT NOT NULL,
  "active" INTEGER NOT NULL DEFAULT 1,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "site_machine_owner" (
  "machine" TEXT,
  "owner" TEXT NOT NULL,
  "seen" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("machine")
);

CREATE TABLE IF NOT EXISTS "topic_votes" (
  "slug" TEXT,
  "visitor" TEXT,
  "vote" INTEGER NOT NULL,
  "at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("slug", "visitor")
);

CREATE TABLE IF NOT EXISTS "agent_capabilities" (
  "key" TEXT,
  "title" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "mode" TEXT NOT NULL DEFAULT 'ask',
  "sort" INTEGER NOT NULL DEFAULT 100,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("key")
);

CREATE TABLE IF NOT EXISTS "agent_log" (
  "id" TEXT,
  "at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "capability" TEXT NOT NULL,
  "summary" TEXT NOT NULL,
  "detail" TEXT NOT NULL DEFAULT '{}',
  "undo" TEXT,
  "undone_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "agent_proposals" (
  "id" TEXT,
  "at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "capability" TEXT NOT NULL,
  "summary" TEXT NOT NULL,
  "payload" TEXT NOT NULL DEFAULT '{}',
  "status" TEXT NOT NULL DEFAULT 'pending',
  "decided_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "agent_state" (
  "id" INTEGER DEFAULT 1,
  "last_run_at" TEXT,
  "last_digest_day" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "agent_chats" (
  "id" TEXT,
  "owner" TEXT NOT NULL,
  "title" TEXT NOT NULL DEFAULT 'New task',
  "feed" TEXT NOT NULL DEFAULT '[]',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "agent_memory" (
  "id" TEXT,
  "owner" TEXT NOT NULL,
  "note" TEXT NOT NULL,
  "at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "mcq_review_log" (
  "set_id" TEXT,
  "reviewed_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "checked" INTEGER NOT NULL DEFAULT 0,
  "dropped" INTEGER NOT NULL DEFAULT 0,
  "disputed" TEXT NOT NULL DEFAULT '[]',
  PRIMARY KEY ("set_id"),
  FOREIGN KEY ("set_id") REFERENCES "mcq_sets" ("id")
);

CREATE TABLE IF NOT EXISTS "mcq_sets_backup_oct16" (
  "id" TEXT,
  "questions" TEXT
);

CREATE TABLE IF NOT EXISTS "paper_fixes" (
  "id" TEXT,
  "article_id" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "issues" TEXT NOT NULL DEFAULT '[]',
  "old_title" TEXT,
  "new_title" TEXT,
  "new_description" TEXT,
  "new_category" TEXT,
  "old_content" TEXT,
  "new_content" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "decided_at" TEXT,
  "seg" INTEGER NOT NULL DEFAULT 0,
  "changed" INTEGER NOT NULL DEFAULT 0,
  "pass" INTEGER NOT NULL DEFAULT 1,
  "first_content" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "seo_backup_oct16" (
  "tbl" TEXT,
  "id" TEXT,
  "meta_title" TEXT,
  "meta_description" TEXT
);

CREATE TABLE IF NOT EXISTS "flashcard_reviews" (
  "user_id" TEXT,
  "set_id" TEXT,
  "card_idx" INTEGER,
  "ef" REAL NOT NULL DEFAULT 2.5,
  "iv" REAL NOT NULL DEFAULT 0,
  "reps" INTEGER NOT NULL DEFAULT 0,
  "lapses" INTEGER NOT NULL DEFAULT 0,
  "due" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "set_id", "card_idx")
);

CREATE TABLE IF NOT EXISTS "user_state" (
  "user_id" TEXT,
  "key" TEXT,
  "value" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "key")
);

CREATE TABLE IF NOT EXISTS "paper_answers" (
  "slug" TEXT,
  "qkey" TEXT,
  "idx" INTEGER NOT NULL,
  "unit" TEXT NOT NULL DEFAULT '',
  "marks" INTEGER,
  "question" TEXT NOT NULL,
  "answer" TEXT,
  "tries" INTEGER NOT NULL DEFAULT 0,
  "answered_at" TEXT,
  "seen_at" TEXT,
  PRIMARY KEY ("slug", "qkey")
);

CREATE TABLE IF NOT EXISTS "paper_seo" (
  "slug" TEXT,
  "description" TEXT NOT NULL,
  "keywords" TEXT NOT NULL DEFAULT '[]',
  "topics" TEXT NOT NULL DEFAULT '[]',
  "tries" INTEGER NOT NULL DEFAULT 0,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("slug")
);

CREATE TABLE IF NOT EXISTS "paper_similar" (
  "slug" TEXT,
  "questions" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("slug")
);

CREATE TABLE IF NOT EXISTS "site_flags" (
  "key" TEXT,
  "value" TEXT NOT NULL DEFAULT '{}',
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("key")
);

CREATE TABLE IF NOT EXISTS "note_image_runs" (
  "article_id" TEXT,
  "added" INTEGER NOT NULL DEFAULT 0,
  "tried_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("article_id")
);

CREATE TABLE IF NOT EXISTS "story_reactions" (
  "story_id" TEXT,
  "user_id" TEXT,
  "kind" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("story_id", "user_id", "kind"),
  FOREIGN KEY ("story_id") REFERENCES "stories" ("id")
);

CREATE TABLE IF NOT EXISTS "story_comments" (
  "id" TEXT,
  "story_id" TEXT NOT NULL,
  "user_id" TEXT NOT NULL,
  "author_name" TEXT NOT NULL,
  "body" TEXT NOT NULL,
  "verified" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" TEXT,
  "avatar_url" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("story_id") REFERENCES "stories" ("id")
);

CREATE TABLE IF NOT EXISTS "story_stats" (
  "story_id" TEXT,
  "views" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("story_id"),
  FOREIGN KEY ("story_id") REFERENCES "stories" ("id")
);

CREATE TABLE IF NOT EXISTS "client_errors" (
  "id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "source" TEXT NOT NULL,
  "message" TEXT NOT NULL,
  "url" TEXT,
  "user_id" TEXT,
  "user_agent" TEXT,
  "extra" TEXT,
  "seen" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "ai_cases" (
  "id" TEXT,
  "rotation" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "level" INTEGER NOT NULL DEFAULT 2,
  "def" TEXT NOT NULL,
  "source_article_id" TEXT,
  "status" TEXT NOT NULL DEFAULT 'published',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "mcq_sets_backup_20261028" (
  "id" TEXT,
  "questions" TEXT NOT NULL,
  "title" TEXT,
  "backed_up_at" TEXT DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "site_visitor_owner" (
  "visitor" TEXT,
  "owner" TEXT NOT NULL,
  "seen" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "user_id" TEXT,
  PRIMARY KEY ("visitor")
);

CREATE TABLE IF NOT EXISTS "zone_rooms" (
  "id" TEXT,
  "code" TEXT NOT NULL,
  "host_id" TEXT NOT NULL,
  "title" TEXT NOT NULL DEFAULT '',
  "topic" TEXT NOT NULL DEFAULT '',
  "mode" TEXT NOT NULL DEFAULT 'speed',
  "settings" TEXT NOT NULL DEFAULT '{}',
  "ai" TEXT,
  "status" TEXT NOT NULL DEFAULT 'lobby',
  "started_at" TEXT,
  "ends_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "paused_at" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "zone_questions" (
  "room_id" TEXT,
  "idx" INTEGER,
  "q" TEXT NOT NULL,
  "options" TEXT NOT NULL,
  "correct" INTEGER NOT NULL,
  "explanation" TEXT NOT NULL DEFAULT '',
  "ai_made" INTEGER NOT NULL DEFAULT 0,
  "kind" TEXT NOT NULL DEFAULT 'mcq',
  "image" TEXT NOT NULL DEFAULT '',
  PRIMARY KEY ("room_id", "idx"),
  FOREIGN KEY ("room_id") REFERENCES "zone_rooms" ("id")
);

CREATE TABLE IF NOT EXISTS "zone_players" (
  "id" TEXT,
  "room_id" TEXT NOT NULL,
  "token" TEXT NOT NULL,
  "nick" TEXT NOT NULL,
  "is_host" INTEGER NOT NULL DEFAULT 0,
  "score" INTEGER NOT NULL DEFAULT 0,
  "correct_n" INTEGER NOT NULL DEFAULT 0,
  "answered_n" INTEGER NOT NULL DEFAULT 0,
  "lives" INTEGER NOT NULL DEFAULT 1,
  "left_n" INTEGER NOT NULL DEFAULT 0,
  "finished" INTEGER NOT NULL DEFAULT 0,
  "total_ms" INTEGER NOT NULL DEFAULT 0,
  "joined_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "user_id" TEXT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("room_id") REFERENCES "zone_rooms" ("id")
);

CREATE TABLE IF NOT EXISTS "zone_answers" (
  "player_id" TEXT,
  "seq" INTEGER,
  "idx" INTEGER NOT NULL,
  "choice" INTEGER NOT NULL,
  "ok" INTEGER NOT NULL,
  "ms" INTEGER NOT NULL,
  PRIMARY KEY ("player_id", "seq"),
  FOREIGN KEY ("player_id") REFERENCES "zone_players" ("id")
);

CREATE TABLE IF NOT EXISTS "zone_history" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "room_code" TEXT NOT NULL,
  "title" TEXT NOT NULL DEFAULT '',
  "topic" TEXT NOT NULL DEFAULT '',
  "game" TEXT NOT NULL DEFAULT 'quiz',
  "mode" TEXT NOT NULL DEFAULT 'speed',
  "score" INTEGER NOT NULL DEFAULT 0,
  "rank" INTEGER NOT NULL DEFAULT 1,
  "players" INTEGER NOT NULL DEFAULT 1,
  "correct_n" INTEGER NOT NULL DEFAULT 0,
  "answered_n" INTEGER NOT NULL DEFAULT 0,
  "total" INTEGER NOT NULL DEFAULT 0,
  "opponents" TEXT NOT NULL DEFAULT '[]',
  "played_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "guide" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "zone_profiles" (
  "user_id" TEXT,
  "friend_code" TEXT NOT NULL,
  "nick" TEXT NOT NULL DEFAULT '',
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id")
);

CREATE TABLE IF NOT EXISTS "zone_friends" (
  "user_id" TEXT,
  "friend_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "friend_id")
);

CREATE TABLE IF NOT EXISTS "onekitty_test_payments" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "external_ref" TEXT NOT NULL,
  "kitty_id" INTEGER NOT NULL,
  "amount" REAL NOT NULL,
  "currency" TEXT NOT NULL DEFAULT 'KES',
  "phone_number" TEXT NOT NULL,
  "payment_mode" TEXT NOT NULL,
  "requested_channel_code" TEXT,
  "provider_payment_ref" TEXT,
  "request_reference" TEXT,
  "checkout_url" TEXT,
  "callback_status" TEXT NOT NULL DEFAULT 'pending',
  "callback_result_code" TEXT,
  "callback_result_desc" TEXT,
  "callback_channel_code" TEXT,
  "callback_transaction_code" TEXT,
  "callback_received_at" TEXT,
  "callback_verified" INTEGER NOT NULL DEFAULT 0,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "research_projects" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "title" TEXT NOT NULL,
  "programme" TEXT NOT NULL DEFAULT '',
  "university" TEXT NOT NULL DEFAULT '',
  "stage" TEXT NOT NULL DEFAULT 'topic_selection',
  "research_question" TEXT NOT NULL DEFAULT '',
  "notes" TEXT NOT NULL DEFAULT '',
  "target_date" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "research_documents" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "project_id" TEXT NOT NULL,
  "storage_path" TEXT NOT NULL,
  "file_name" TEXT NOT NULL,
  "mime_type" TEXT NOT NULL DEFAULT 'application/octet-stream',
  "size_bytes" INTEGER NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("project_id") REFERENCES "research_projects" ("id")
);

CREATE TABLE IF NOT EXISTS "site_device_daily" (
  "day" TEXT,
  "device" TEXT,
  "views" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("day", "device")
);

CREATE TABLE IF NOT EXISTS "site_analytics_daily" (
  "day" TEXT,
  "event_name" TEXT,
  "events" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("day", "event_name")
);

CREATE TABLE IF NOT EXISTS "lite_students" (
  "id" TEXT,
  "phone_number" TEXT NOT NULL,
  "full_name" TEXT NOT NULL,
  "study_level" TEXT NOT NULL,
  "sms_opt_in" INTEGER NOT NULL DEFAULT 0,
  "sms_opt_in_at" TEXT,
  "preferred_subject" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "lite_attempts" (
  "id" TEXT,
  "student_id" TEXT NOT NULL,
  "mcq_set_id" TEXT NOT NULL,
  "question_index" INTEGER NOT NULL,
  "selected_option" INTEGER NOT NULL,
  "is_correct" INTEGER NOT NULL,
  "attempted_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("student_id") REFERENCES "lite_students" ("id"),
  FOREIGN KEY ("mcq_set_id") REFERENCES "mcq_sets" ("id")
);

CREATE TABLE IF NOT EXISTS "lite_sms_deliveries" (
  "id" TEXT,
  "student_id" TEXT NOT NULL,
  "mcq_set_id" TEXT NOT NULL,
  "question_index" INTEGER NOT NULL,
  "delivery_date" TEXT NOT NULL,
  "short_code" TEXT NOT NULL,
  "provider_status" TEXT,
  "provider_message_id" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("mcq_set_id") REFERENCES "mcq_sets" ("id"),
  FOREIGN KEY ("student_id") REFERENCES "lite_students" ("id")
);

CREATE TABLE IF NOT EXISTS "lite_sms_settings" (
  "id" INTEGER DEFAULT 1,
  "enabled" INTEGER NOT NULL DEFAULT 0,
  "environment" TEXT NOT NULL DEFAULT 'sandbox',
  "sender_id" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "lite_health_encounters" (
  "id" TEXT,
  "session_id" TEXT NOT NULL,
  "phone_number" TEXT,
  "channel" TEXT NOT NULL DEFAULT 'ussd',
  "status" TEXT NOT NULL DEFAULT 'intake_started',
  "consent_given" INTEGER NOT NULL DEFAULT 0,
  "consented_at" TEXT,
  "preferred_language" TEXT NOT NULL DEFAULT 'en',
  "concern_category" TEXT,
  "original_message" TEXT,
  "normalized_summary" TEXT,
  "clarification_answers" TEXT NOT NULL DEFAULT '[]',
  "red_flag_results" TEXT NOT NULL DEFAULT '[]',
  "urgency_level" TEXT NOT NULL DEFAULT 'not_assessed',
  "assessment" TEXT,
  "guide_url" TEXT,
  "sms_consent" INTEGER NOT NULL DEFAULT 0,
  "sms_sent_at" TEXT,
  "support_reference" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "expires_at" TEXT NOT NULL,
  "resume_base_answers" TEXT NOT NULL DEFAULT '[]',
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "lite_health_guide_tokens" (
  "id" TEXT,
  "encounter_id" TEXT NOT NULL,
  "resource_slug" TEXT NOT NULL,
  "token_hash" TEXT NOT NULL,
  "expires_at" TEXT NOT NULL,
  "revoked_at" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "last_accessed_at" TEXT,
  "access_count" INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("encounter_id") REFERENCES "lite_health_encounters" ("id")
);

CREATE TABLE IF NOT EXISTS "lite_patient_guide_approvals" (
  "id" TEXT,
  "article_id" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'pending',
  "patient_language" TEXT NOT NULL DEFAULT 'en',
  "audience" TEXT NOT NULL DEFAULT 'general',
  "reviewer_user_id" TEXT,
  "reviewer_name" TEXT,
  "reviewer_qualification" TEXT,
  "registration_body" TEXT,
  "registration_number" TEXT,
  "reviewer_attested" INTEGER NOT NULL DEFAULT 0,
  "review_notes" TEXT,
  "reviewed_at" TEXT,
  "review_due_at" TEXT,
  "article_updated_at_snapshot" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("article_id") REFERENCES "articles" ("id")
);

CREATE TABLE IF NOT EXISTS "lite_operations_settings" (
  "id" INTEGER DEFAULT 1,
  "ussd_enabled" INTEGER NOT NULL DEFAULT 1,
  "ai_enabled" INTEGER NOT NULL DEFAULT 0,
  "ai_daily_limit" INTEGER NOT NULL DEFAULT 100,
  "updated_by" TEXT,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "mcq_practice_attempts" (
  "id" TEXT,
  "user_id" TEXT NOT NULL,
  "mcq_set_id" TEXT NOT NULL,
  "session_id" TEXT NOT NULL,
  "score" INTEGER NOT NULL DEFAULT 0,
  "attempted" INTEGER NOT NULL DEFAULT 0,
  "total" INTEGER NOT NULL,
  "duration_seconds" INTEGER NOT NULL DEFAULT 0,
  "timer_minutes" INTEGER,
  "completed_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("mcq_set_id") REFERENCES "mcq_sets" ("id")
);

CREATE TABLE IF NOT EXISTS "feature_usage" (
  "user_id" TEXT,
  "feature" TEXT,
  "period_start" TEXT,
  "used" INTEGER NOT NULL DEFAULT 0,
  "updated_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("user_id", "feature", "period_start")
);
