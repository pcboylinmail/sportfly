# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161118123513) do

  create_table "askings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_askings_on_question_id", using: :btree
    t.index ["user_id"], name: "index_askings_on_user_id", using: :btree
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text     "content",      limit: 65535, null: false
    t.integer  "user_id"
    t.integer  "live_show_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["live_show_id"], name: "index_chats_on_live_show_id", using: :btree
    t.index ["user_id"], name: "index_chats_on_user_id", using: :btree
  end

  create_table "followings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["follower_id"], name: "index_followings_on_follower_id", using: :btree
    t.index ["user_id"], name: "index_followings_on_user_id", using: :btree
  end

  create_table "live_shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "fb_url"
    t.index ["user_id"], name: "index_live_shows_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text     "content",      limit: 65535
    t.integer  "user_id"
    t.integer  "live_show_id"
    t.integer  "likes_count",                default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "subject",                  null: false
    t.integer  "live_show_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "users_count",  default: 0
    t.integer  "user_id"
    t.index ["live_show_id"], name: "index_questions_on_live_show_id", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "channel_name"
    t.text     "description",            limit: 65535
    t.boolean  "live_owner",                           default: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "fb_name"
    t.string   "fb_image"
    t.string   "fb_link"
    t.string   "gender"
    t.string   "authentication_token"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "watchings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "user_id"
    t.integer  "live_show_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["live_show_id"], name: "index_watchings_on_live_show_id", using: :btree
    t.index ["user_id"], name: "index_watchings_on_user_id", using: :btree
  end

end
