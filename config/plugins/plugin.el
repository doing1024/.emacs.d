(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;;; Packages
(require 'add-path)
(require 'smalls)
(require 'config-window-numbering)
(require 'config-ivy)
(require 'config-dashboard)
(require 'config-org-mode)
(require 'config-treemacs)
(if doingemacs-enable-auto-save (require 'config-auto-save))
(if doingemacs-enable-tab (require 'config-sort-tab))
(require 'config-treesit)
(if doingemacs-enable-flycheck (require 'config-flycheck))
(if doingemacs-enable-language-complete (progn (require 'config-company)
					(require 'config-lsp)))
(require 'doing-translate)
(if doingemacs-enable-eaf (require 'config-eaf))
(provide 'plugin)
;;; plugin.el ends here
