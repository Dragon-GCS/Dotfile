-- 行号显示
vim.opt.number = true
vim.opt.relativenumber = true
-- 设置编码格式
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
--光标上下行的最少行数 列数
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
-- 搜索高亮显示
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- 开启鼠标控制和粘贴板
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
-- tab设置
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- 忽略大小写并开启智能大小写
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 外部改动时自动更新
vim.opt.autoread = true
vim.bo.autoread = true
-- 自动保存
vim.opt.autowriteall = true
-- 关闭标号
vim.wo.signcolumn = "no"
