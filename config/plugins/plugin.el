(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;;; Packages
(require 'add-path)
(require 'manatees)
(require 'smalls)
(require 'langs)

(provide 'plugin)
;;; plugin.el ends here
