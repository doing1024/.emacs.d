(require 'flycheck)
(setq truncate-lines nil) ; 如果单行信息很长会自动换行


(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
	(c . ("https://github.com/tree-sitter/tree-sitter-c"))
	(cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
	(css . ("https://github.com/tree-sitter/tree-sitter-css"))
	(cmake . ("https://github.com/uyha/tree-sitter-cmake"))
	(csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
	(dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
	(elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
	(go . ("https://github.com/tree-sitter/tree-sitter-go"))
	(gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
	(html . ("https://github.com/tree-sitter/tree-sitter-html"))
	(java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
	(javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
	(json . ("https://github.com/tree-sitter/tree-sitter-json"))
	(lua . ("https://github.com/Azganoth/tree-sitter-lua"))
	(make . ("https://github.com/alemuller/tree-sitter-make"))
	(markdown . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
	(ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
	(org . ("https://github.com/milisims/tree-sitter-org"))
	(python . ("https://github.com/tree-sitter/tree-sitter-python"))
	(php . ("https://github.com/tree-sitter/tree-sitter-php"))
	(typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
	(tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	(ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
	(rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
	(sql . ("https://github.com/m-novikov/tree-sitter-sql"))
	(vue . ("https://github.com/merico-dev/tree-sitter-vue"))
	(yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
	(toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
	(zig . ("https://github.com/GrayJack/tree-sitter-zig"))))
;;; LSP Mode
(require 'company)
(global-company-mode)
(setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 0.0)
(setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
(setq company-selection-wrap-around t)
(setq company-transformers '(company-sort-by-occurrence))
(setq lsp-keymap-prefix "C-c l"
      lsp-file-watch-threshold 500)
(require 'lsp-mode)
(setq lsp-headerline-breadcrumb-enable t)

(require 'lsp-ui)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-doc-position 'top)

(provide 'langs)
;;; langs.el ends here

