(require 'sort-tab)
(sort-tab-mode 1)
(require 'auto-save)
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
(setq auto-save-disable-predicates
      '((lambda ()
	  (string-suffix-p
	   "gpg"
	   (file-name-extension (buffer-name)) t))))
(require 'awesome-tray)
(awesome-tray-mode 1)
(require 'eaf)
; (require 'eaf-org-previewer)
(require 'eaf-markdown-previewer)
(require 'eaf-video-player)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-git)
(require 'eaf-music-player)
(require 'eaf-markmap)
(setq eaf-webengine-pc-user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.use")

(provide 'manatees)
;;; manatees.el ends here
