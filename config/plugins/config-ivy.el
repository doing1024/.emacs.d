(require 'ivy)
(require 'swiper)
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq search-default-mode #'char-fold-to-regexp)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-use-selectable-prompt t)
(require 'counsel)
(require 'amx)
(amx-mode)
(kb "M-d f c" 'counsel-rg)
(kb "M-d f f" 'counsel-fzf)
(kb "C-s" 'swiper)
(kb "C-x b" 'ivy-switch-buffer)
(kb "C-c v" 'ivy-push-view)
(kb "C-c s" 'ivy-switch-view)
(kb "C-c V" 'ivy-pop-view)
(kb "C-x C-@" 'counsel-mark-ring)
(kb "C-x C-SPC" 'counsel-mark-ring)

(provide 'config-ivy)
;;; config-ivy.el ends here