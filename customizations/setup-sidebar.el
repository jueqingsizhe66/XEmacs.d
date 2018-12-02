(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/org-sidebar//")
(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/org-ql//")
(add-to-list 'load-path "~/.emacs.d/customizations/my_plugins/org-super-agenda//")
(load "org-sidebar.el")
(load "org-ql-agenda.el")
(load "org-ql.el")

(org-sidebar-defsidebar my-sidebar
  :header "My Sidebar"
  :sidebars ((and (not (done))
                  (or (deadline <=)
                      (date = today)))))

(org-sidebar-defsidebar today-sidebar
  :header "Today"
  :sidebars (((and (not (done))
                   (or (deadline <=)
                       (scheduled <=)
                       (date = today)))))
  :super-groups '((:time-grid t)
                  (:name "Overdue" :scheduled past :deadline past)
                  (:name "Due today" :scheduled today :deadline today)
                  (:tag "bills")
                  (:priority "A")
                  (:name "Non-tasks"
                         :todo nil)))

