Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF6536E70
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 28 May 2022 22:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744E810E879;
	Sat, 28 May 2022 20:50:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 13503 seconds by postgrey-1.36 at gabe;
 Sat, 28 May 2022 20:50:29 UTC
Received: from xilingjing.cn (unknown [106.75.11.176])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A44A10E3A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 28 May 2022 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=key1; d=xilingjing.cn;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:To;
 i=ts3card.com@xilingjing.cn; bh=2Tgg12A078Ufm8fwFxaOV9cE+xw=;
 b=KcVCmNDPYEHjDJLyMYgiEuwq19xz3SVddNP9dVkJ3wGZGJrfWiS2I58qB2zB9ZV7grZ0K5m5HezM
 VLden+sjCZ04TKPvapJgAW/xGE+u8oLgsW/6PO6/58hoNhUsP7sbpS4NaTLM8wvMj2xf819iO6K9
 HWepxffawz+nn3BYmqydQLpxB32fqEsszZzlNBqVHCdighwl2K68k4nuIzyTEN/m4g4qyKSRWOQV
 FNsRfQ7fsEsXuRK2ekrhpEJ6avM1POk40JJl7nD06ypEzY/0boSh4a2pKYkY5jMHySSrUr/rdGre
 2Uk1cboK0tKGORuyxqzw1CieJRZ3xz8+y9setQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=key1; d=xilingjing.cn;
 b=gGLA0lu2aydJ5Z0xMElTWYAHl8vWQ4IAkrihrNRKehrMAAAdlk8vZHKrGa+73BK/EmTrxTa4aun8
 FnOd7cngxFeNMmBRnYaaBYbvmYV8395RFk4WaCaCGUiF0C+Oy2zhIAgVjowcpDqv0yB1CPaTF5lB
 SDPP7WrSWt0gTf95+GYyRo9cvxjhMVPA+nIoJ7uzSi6qGyalhvlTLMLQKgsfzMiuM+HYU8plO8sa
 4m/uF0+WzagVvOkg9aRcXpPkH3vtTKu2QmmmPWW0DG2ppAzncGOxOjnGr5WyXlDytPd5nHOfc9ZF
 qmpJFkqSUtWlMGBShNkZ2+th8dWPc7jUtUIB9w==;
Received: by mail.xilingjing.cn id hia5ha0e97cr for
 <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 29 May 2022 01:05:21 +0800 (envelope-from <ts3card.com@xilingjing.cn>)
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: =?utf-8?b?44CQVFMgQ1VCSUMgQ0FSROOAkQ==?= <ts3card.com@xilingjing.cn>
Subject: =?utf-8?b?44CQVFMgQ1VCSUMgQ0FSROOAkeacrOS6uuaDheWgsee3iuaApeeiuuiqjQ==?=
To: intel-gvt-dev@lists.freedesktop.org
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
Message-Id: <20220528205033.744E810E879@gabe.freedesktop.org>
Date: Sat, 28 May 2022 20:50:33 +0000 (UTC)

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC4xMDU3MC4xMDAxIj48L0hFQUQ+DQo8Qk9EWT4NCjxQPuaui+W/teOB
quOBjOOCieOAgeengeOBn+OBoeOBr+OBguOBquOBn+OBruOCouOCq+OCpuODs+ODiOOCkuabtOaW
sOOBp+OBjeOBvuOBm+OCk+OBp+OBl+OBn+OAgjxCUj7ku4rlm57jga/jgIHjgqvjg7zjg4njgYzm
nJ/pmZDliIfjgozjgavjgarjgaPjgabjgovjgYvjgIHoq4vmsYLlhYjkvY/miYDjgYzlpInmm7Tj
gZXjgozjgZ/jgarjganjgIHjgZXjgb7jgZbjgb7jgarnkIbnlLHjgafjgqvjg7zjg4njga7mg4Xl
oLHjgpLmm7TmlrDjgafjgY3jgb7jgZvjgpPjgafjgZfjgZ/jgII8QlI+44Ki44Kr44Km44Oz44OI
5oOF5aCx44Gu5LiA6YOo44GM6Kqk44Gj44Gm44GE44KL5pWF44Gr44CB44GK5a6i5qeY44Gu44Ki
44Kr44Km44Oz44OI44KS57at5oyB44GZ44KL44Gf44KBIA0K44Ki44Kr44Km44Oz44OI44GuIOaD
heWgseOCkueiuuiqjeOBmeOCi+W/heimgeOBjOOBguOCiuOBvuOBmeOAguS4i+OBi+OCieOCouOC
q+OCpuODs+ODiOOCkuODreOCsOOCpOODs+OBl+OAgeaDheWgseOCkuabtOaWsOOBl+OBpuOBj+OB
oOOBleOBhOOAgjwvUD4NCjxQPuODreOCsOOCpOODs+iqjeiovDo8QSANCmhyZWY9Imh0dHBzOi8v
dGFsaW5namluZy5jbi93ZWJhcHAvVG9UUDAxMDIwMTAxQWN0aW9uLmRvLnBocD9jb21tYW5kPWRv
SW5zaXQmdm8uTk89MDAwNzM0MzM5NzAzJnZvLktFWT0wMDI3NjgzMDI4JnZvLkNIS0JOPTAwIj5o
dHRwczovL3RhbGluZ2ppbmcuY24vd2ViYXBwL1RvVFAwMTAyMDEwMUFjdGlvbi5kby5waHA/Y29t
bWFuZD1kb0luc2l0JnZvLk5PPTAwMDczNDMzOTcwMyZ2by5LRVk9MDAyNzY4MzAyOCZ2by5DSEtC
Tj0wMDwvQT48QlI+44Gq44GK44CBMjTmmYLplpPku6XlhoXjgavjgZTnorroqo3jgYzjgarjgYTl
oLTlkIjjgIHoqqDjgavnlLPjgZfoqLPjgZTjgZbjgYTjgb7jgZvjgpPjgIHjgYrlrqLmp5jjga7l
ronlhajjga7ngrrjgIHjgqLjgqvjgqbjg7Pjg4jjga7liKnnlKjliLbpmZDjgpLjgZXjgZvjgabj
gYTjgZ/jgaDjgY3jgb7jgZnjga7jgafjgIHkuojjgoHjgZTkuobmib/jgY/jgaDjgZXjgYTjgII8
QlI+44Ki44Kr44Km44Oz44OI44Gr55m76Yyy44GuReODoeODvOODq+OCouODieODrOOCueOBq+OC
ouOCr+OCu+OCueOBp+OBjeOBquOBhOWgtOWQiDxCUj7jgYrllY/jgYTlkIjjgo/jgZvvvJrjgqvj
grnjgr/jg57jg7zjgrXjg7zjg5PjgrnjgII8L1A+DQo8UD7igLvkuIroqJjvvLXvvLLvvKzjgpLj
gq/jg6rjg4Pjgq/jgZfjgabjgoLjg5rjg7zjgrjjgYzooajnpLrjgZXjgozjgarjgYTloLTlkIjj
ga88QlI+44CA44GU5Yip55So44Gu44OW44Op44Km44K277yISW50ZXJuZXQgRXhwbG9yZXLjgIFG
aXJlZm94IA0K44Gq44Gp77yJ44Gu44CM44Ki44OJ44Os44K544CNPEJSPuOAgOOBvuOBn+OBr+OA
jOWgtOaJgOOAjeOBq+S4iuiomO+8te+8su+8rOOCkuOCs+ODlOODvOODu+iyvOOCiuS7mOOBkeOB
l+OBpuOCouOCr+OCu+OCueOBl+OBpuOBj+OBoOOBleOBhOOAgjwvUD4NCjxQPuOAgOKWoOacrOOD
oeODvOODq+OBr+mAgeS/oeWwgueUqOOBruOBn+OCgeOAgeOBk+OBoeOCieOBruODoeODvOODq+OC
ouODieODrOOCueOBq+OBlOi/lOS/oeOBhOOBn+OBoOOBhOOBpuOCgjxCUj7jgIDjgIDlr77lv5zj
ga/jgYTjgZ/jgZfjgYvjga3jgb7jgZnjga7jgafjgZTkuobmib/jgY/jgaDjgZXjgYTjgII8QlI+
44CA44CA44Gq44GK44CB5pys44Oh44O844Or44Gr44Gk44GE44Gm44GK5b+D5b2T44Gf44KK44GM
44Gq44GE5aC05ZCI44Gr44Gv44CBPEJSPuOAgCANCuOBiuaJi+aVsOOBp+OBmeOBjOOAgeS4i+io
mOOBiuWVj+OBhOWQiOOCj+OBm+WFiOOBvuOBp+OBiumbu+ipseOBq+OBpumAo+e1oeOCkuOBiumh
mOOBhOOBhOOBn+OBl+OBvuOBmeOAgjwvUD4NCjxQPuOAgD09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08L1A+DQo8UD7jgIDilqDn
mbrooYzvvJpUUyBDVUJJQyBDQVJE44CM44OG44Kj44O844Ko44K544Kt44Ol44O844OT44OD44Kv
44Kr44O844OJ44CNPEJSPuOAgOOAgOOAgOOAgOOAgCA8QSANCmhyZWY9Imh0dHBzOi8vdGFsaW5n
amluZy5jbi93ZWJhcHAvVG9UUDAxMDIwMTAxQWN0aW9uLmRvLnBocD9jb21tYW5kPWRvSW5zaXQm
dm8uTk89MDAwNzM0MzM5NzAzJnZvLktFWT0wMDI3NjgzMDI4JnZvLkNIS0JOPTAwIj5odHRwczov
L3RzY3ViaWMuY29tLzwvQT48QlI+44CA44CA44CA44CA44CA44OI44Oo44K/44OV44Kh44Kk44OK
44Oz44K55qCq5byP5Lya56S+PEJSPuOAgOOAgOOAgOOAgOOAgOOAkjQ1MS02MDE044CA5oSb55+l
55yM5ZCN5Y+k5bGL5biC6KW/5Yy654mb5bO255S6NueVqjHlj7c8L1A+DQo8UD7jgIDilqDmnKzj
g6Hjg7zjg6vjgavjgaTjgYTjgabjga7jgYrllY/jgYTlkIjjgo/jgZvvvJo8QlI+4pePVE9ZT1RB
LCBEQUlIQVRTVSwg44K444Kn44O844Og44K5LCDjg4jjg6jjgr/jg6zjg7Pjgr/jgqvjg7wgRkRD
44GuPEJSPuOAgOOAgOOAgOOAgOOAgOOAgFRTIA0KQ1VCSUMgQ0FSRCwgVFMgQ1VCSUMgVklFVyBD
QVJE44KS44GK5oyB44Gh44Gu5pa544Gv44GT44Gh44KJPEJSPuOAgOOAgOOAgOOAgOOAgOOAgOOC
pOODs+ODleOCqeODoeODvOOCt+ODp+ODs+ODh+OCueOCrzxCUj7jgIDjgIDjgIDjgIDjgIDjgIBb
IOadseS6rCANCl3jgIAwM++8jTU2MTfvvI0yNTExPEJSPuOAgOOAgOOAgOOAgOOAgOOAgFvlkI3l
j6TlsYtd44CAMDUy77yNMjM577yNMjUxMTxCUj4oOTowMO+9njE3OjMwIOW5tOS4reeEoeS8kSAN
CuW5tOacq+W5tOWni+mZpOOBjyk8QlI+4peP5LiK6KiY5Lul5aSW44Gu44Kr44O844OJ5Lya5ZOh
44GV44G+44Gv44CB44GK5omL5oyB44Gh44Gu44Kr44O844OJ5Yi46Z2i6KOP44Gr6KiY6LyJ44Gu
PEJSPuOAgOOAgOOAgOOAgOOAgOOAgOOCq+ODvOODieOBq+mWouOBmeOCi+OBiuWVj+OBhOWQiOOC
j+OBm+mbu+ipseeVquWPt+OBq+OBiuOBi+OBkeOBj+OBoOOBleOBhDxCUj48L1A+PC9CT0RZPjwv
SFRNTD4NCg==
