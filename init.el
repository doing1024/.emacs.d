;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/plugins")
(require 'basic)
(require 'hooks)
(require 'keys)
(require 'org)
(require 'plugin)

(provide 'init)
;;; init.el ends here
