;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
;;; 基础配置
(electric-pair-mode t)            ; 自动补全括号
(global-auto-revert-mode t)         ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)          ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)       ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)         ; 关闭文件自动备份
(auto-save-mode nil)
(tool-bar-mode -1)              ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(setq my-http-proxy "127.0.0.1:12334")
(setq my-socks-proxy "127.0.0.1:12334")
(setq eaf-proxy-type "http")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "12334")
(setq auto-save-default nil)

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
;;; KeyBorads
(defun next-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (next-buffer)
    (while
        (and (and (not (equal "*vterm*" (buffer-name))) (not (equal "*terminal*" (buffer-name)))) (and
												   (string-match-p "^\*" (buffer-name))
												   (not ( equal bread-crumb (buffer-name) )) ))
      (next-buffer))))
(defun prev-code-buffer ()
  (interactive)
  (let (( bread-crumb (buffer-name) ))
    (previous-buffer)
    (while
        (and (and (not (equal "*vterm*" (buffer-name))) (not (equal "*terminal*" (buffer-name)))) (and
												   (string-match-p "^\*" (buffer-name))
												   (not ( equal bread-crumb (buffer-name) )) ))
      (previous-buffer))))
(defun open-my-init-file()
  "No Document."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; (global-set-key (kbd "C-<tab>") 'next-code-buffer)
;; (global-set-key (kbd "C-<iso-lefttab>") 'prev-code-buffer)
(global-set-key (kbd "C-<tab>") 'sort-tab-select-next-tab)
(global-set-key (kbd "C-<iso-lefttab>") 'sort-tab-select-prev-tab)
(global-set-key (kbd "C-<return>") 'sort-tab-close-current-tab)
(global-set-key (kbd "C-1") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-2") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-3") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-4") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-5") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-6") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-7") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-8") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-9") 'sort-tab-select-visible-tab)
(global-set-key (kbd "C-0") 'sort-tab-select-visible-tab)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<f6>") 'dashboard-mode)
(global-set-key (kbd "M-d") nil)
(define-prefix-command 'meta-d-map)
(global-set-key (kbd "M-d f d o") 'open-my-init-file)
(global-set-key (kbd "M-d w /") 'split-window-right)
(global-set-key (kbd "M-d w -") 'split-window-below)
(global-set-key (kbd "M-d b d") 'kill-this-buffer)
(global-set-key (kbd "M-d b w d") 'kill-buffer-and-window)
(global-set-key (kbd "M-d w h  +") 'enlarge-window-horizontally)
(global-set-key (kbd "M-d w h -") 'shrink-window-horizontally)
(global-set-key (kbd "M-d w c +") 'enlarge-window)
(global-set-key (kbd "M-d w c -") 'shrink-window)
(global-set-key (kbd "M-d w d") 'delete-window)
(global-set-key (kbd "M-d f t") 'treemacs)
(global-set-key (kbd "M-d f d r") 'eval-buffer)
(global-set-key (kbd "M-d l") 'goto-line)
(global-set-key (kbd "M-d e o") 'eaf-open)
(global-set-key (kbd "M-d e b") 'eaf-open-browser-with-history)
(global-set-key (kbd "M-d c a") 'format-all-buffer)
(global-set-key (kbd "M-d c l") 'lsp)
(global-set-key (kbd "M-d c c") 'comment-or-uncomment-region)
;; Plugin Keyborads
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c s") 'ivy-switch-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-x C-@") 'counsel-mark-ring)
(global-set-key (kbd "C-x C-SPC") 'counsel-mark-ring)
(global-set-key (kbd "C-c l s") 'lsp-ivy-workspace-symbol)

(auto-fill-mode)
(fset 'yes-or-no-p 'y-or-n-p) ;; 按y或space表示yes,n表示no
					; (load-theme 'timu-macos t)
					; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'atom-one-dark t)
(set-frame-font "Jetbrains Mono")
(dolist (charset '(han kana symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "TsangerJinKai01-27533")
		    ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("75eef60308d7328ed14fa27002e85de255c2342e73275173a14ed3aa1643d545" "9f2a181c19c10162f6135a007443d5e7e5524070f7aedd5d4c442cc80e7d3ebe" "fd97287ee9740bc060128fc80a7e30e6bd5f5ab0f4b83d4433ddf151e0febae6" "0f4e8712faa97372f505cac514d11f7fa0891e1dfc8bdf03208247b31fa29a01" default))
 '(package-selected-packages
   '(svg-clock web-mode magit yasnippet window-numbering which-key treemacs tree-sitter-langs rainbow-delimiters pangu-spacing org-modern org-bullets olivetti mwim lsp-ui lsp-pyright lsp-ivy format-all flycheck dracula-theme dashboard counsel-projectile company atom-one-dark-theme amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;;; Packages
(require 'cl-lib)

(defun add-subdirs-to-load-path (search-dir)
  (interactive)
  (let* ((dir (file-name-as-directory search-dir)))
    (dolist (subdir
             ;; 过滤出不必要的目录， 提升 Emacs 启动速度
             (cl-remove-if
              #'(lambda (subdir)
                  (or
                   ;; 不是目录的都移除
                   (not (file-directory-p (concat dir subdir)))
                   ;; 目录匹配下面规则的都移除
                   (member subdir '("." ".." ;Linux 当前目录和父目录
                                    "dist" "node_modules" "__pycache__" "tests" "screenshots" "doc" "icons" "test" ;语言相关的模块目录
                                    "RCS" "CVS" "rcs" "cvs" ".git" ".github")))) ;版本控制目录
              (directory-files dir)))
      (let ((subdir-path (concat dir (file-name-as-directory subdir))))
        ;; 目录下有 .el .so .dll 文件的路径才添加到 load-path 中， 提升 Emacs 启动速度
        (when (cl-some #'(lambda (subdir-file)
                           (and (file-regular-p (concat subdir-path subdir-file))
                                ;; .so .dll 文件指非 Elisp 语言编写的 Emacs 动态库
                                (member (file-name-extension subdir-file) '("el" "so" "dll"))))
                       (directory-files subdir-path))

          ;; 注意： add-to-list 函数的第三个参数必须为 t ， 表示加到列表末尾
          ;; 这样 Emacs 会从父目录到子目录的顺序搜索 Elisp 插件， 顺序反过来会导致 Emacs 无法正常启动
          (add-to-list 'load-path subdir-path t))

        ;; 继续递归搜索子目录
        (add-subdirs-to-load-path subdir-path)))))

(add-subdirs-to-load-path "~/.emacs.d/site-lisp/")
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
(require 'eaf-org-previewer)
(require 'eaf-markdown-previewer)
(require 'eaf-video-player)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-git)
(require 'eaf-music-player)
(require 'eaf-markmap)
(setq eaf-webengine-pc-user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.use")

(require 'mwim)
(add-to-list 'custom-theme-load-path "~/.emacs.d/path/to/atom-one-dark-theme/")
(require 'treemacs)
(require 'window-numbering)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*sort-tab*") 9)))
(window-numbering-mode)

(require 'counsel)
(setq ivy-use-selectable-prompt t)
(require 'ivy)
(require 'swiper)
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq search-default-mode #'char-fold-to-regexp)
(setq ivy-count-format "(%d/%d) ")

(require 'amx)
(amx-mode)
(require 'which-key)
(which-key-mode)
(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(require 'dashboard)
(setq dashboard-banner-logo-title "Doing's Emacs") ;; 个性签名，随读者喜好设置
(setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
(setq dashboard-startup-banner "~/.emacs.d/logo.png") ;; 也可以自定义图片
(setq dashboard-items '((recents . 10)  ;; 显示多少个最近文件
			(bookmarks . 10) ;; 显示多少个最近书签
			(projects . 10))) ;; 显示多少个最近项目
(dashboard-setup-startup-hook)
(require 'rainbow-delimiters)


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
