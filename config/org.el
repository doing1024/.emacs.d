;;; Org Mode Settings
(setq org-startup-indented t
      org-src-tab-acts-natively t)
(setq org-hide-emphasis-markers t)
(setq valign-fancy-bar t)
(use-package org-bullets
  :ensure t
  :custom
  (org-bullets-bullet-list '("◉" "✸" "✿" "✜" "◆"))
  (org-ellipsis "⤵")
  :hook (org-mode . org-bullets-mode))

(provide 'org)
;;; org.el ends here

