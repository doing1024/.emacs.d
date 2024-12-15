;;; Hooks
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'format-all-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'flycheck-mode)
;; LSP hooks
(add-hook 'mhtml-mode-hook #'lsp-deferred)
(add-hook 'html-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'python-mode-hook #'lsp-deferred)
(add-hook 'js-mode-hook #'lsp-defberred)
(add-hook 'css-mode-hook #'lsp-deferred)
(add-hook 'sh-mode-hook #'lsp-deferred)
(add-hook 'lsp-mode #'lsp-enable-which-key-integration)

					;(add-hook 'prog-mode-hook #'lsp-deferred)
(add-hook 'html-mode-hook #'web-mode)

(provide 'hooks)
;;; hooks.el ends here
