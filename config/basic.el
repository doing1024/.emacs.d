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

(provide 'basic)
;;; basic.el ends here
