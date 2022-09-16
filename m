Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22D5BACEA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Sep 2022 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237410ED15;
	Fri, 16 Sep 2022 12:03:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Fri, 16 Sep 2022 12:03:09 UTC
Received: from ujkhfqk.cn (unknown [117.50.173.229])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C88010E218
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Sep 2022 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=key1; d=ujkhfqk.cn;
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:From:Subject:To;
 i=cedyna@ujkhfqk.cn; bh=OaeBdhenSoVCVDWVZYWoQL/ifWY=;
 b=C4fBkfCYkzdPixHv+wK66ngHUy0k0drZfyOEsSC86cSonsuMcahf0EGxH4O9X9O8FscrFeccZjoR
 wkeNx1byU/nSFi7z1xV0jbaPfTitzL+jYWRgZ4Xngevo0yVtWqQGnutwULjZoj0GT0TKpabt4YW7
 ZjHzogaNWYofsR6HVDulioon7VLvjX729tpYUogzsUEklmpr64L5VcCqdirDObrSHAB1NMp6xqOH
 GSJLenuCqjK+2T7bGyQSaF1FPE1ebTOJaBj/DM4W/elnBt/QSVppgCs8VbxYxpYIW+vWXejwM66T
 iTTD/f035u2jpsTx4Q+EtmOkHpW/NM7KLBCS/w==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=key1; d=ujkhfqk.cn;
 b=Qx+ElNq+MMG3IjH/QuOAThEwNNcbUVlg7/A7Yk5oJU8p002Y9ChHiH99PfekWFmbuUsD7ANmF7If
 /HsS63Gy7iwdFyU6xhXeiEd/SSTVov5bLvrqRXa11Oe80SE0C8VXJTLcaJSpTdcWO3XuGjwzyrAG
 Klh3kqBIelnwVGL4SSKycrla6PfmuBEB6gofVJfJWwJQ5utfrqILA+7T5Rlx/0L0I+xxHxdatVS1
 GeRvFCHmXbO0GKSTitMYSXecQVnNz/9nCwUYHLkeA8PAwBA8BITzP89TorLjMgmgFU7elaknzcEs
 yPxUdTR06OobXI5MGgXq7yRC1uUiKW2zhzo/tA==;
Received: by mail.ujkhfqk.cn id h4hivq0e97cv for
 <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Sep 2022 19:52:35 +0800 (envelope-from <cedyna@ujkhfqk.cn>)
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: =?utf-8?q?cedynacard?= <cedyna@ujkhfqk.cn>
Subject: =?utf-8?b?44CQ44K744OH44Kj44OK44Kr44O844OJ44CR44GU55m76Yyy44GK5a6i5qeY?=
 =?utf-8?b?5oOF5aCx44Gu5a6a5pyf55qE44Gq56K66KqN44Gu44GK6aGY44GE44Gr44Gk?=
 =?utf-8?b?44GN44G+44GX44Gm?=
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
Message-Id: <20220916120313.7237410ED15@gabe.freedesktop.org>
Date: Fri, 16 Sep 2022 12:03:13 +0000 (UTC)

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUcmFuc2l0aW9uYWwv
L0VOIj4NCjxIVE1MPjxIRUFEPg0KPE1FVEEgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0
Zi04IiBodHRwLWVxdWl2PUNvbnRlbnQtVHlwZT4NCjxNRVRBIG5hbWU9R0VORVJBVE9SIGNvbnRl
bnQ9Ik1TSFRNTCAxMS4wMC4xMDU3MC4xMDAxIj48L0hFQUQ+DQo8Qk9EWT4NCjxQPuOCu+ODh+OC
o+ODiuOCq+ODvOODieWIqeeUqOOBruOBiuWuouanmDxCUj7jgrvjgq3jg6Xjg6rjg4bjgqPjgrnj
g4bjg6DjgpLmm7TmlrDjga7jgYrnn6XjgonjgZvjgajnmbvpjLLmg4XloLHnorroqo3jga7jgYrp
oZjjgavjgaTjgY3jgb7jgZfjgaY8QlI+6Kmz57SwOiA8QSANCmhyZWY9Imh0dHBzOi8vd2FpY3V5
ZGwuY24vbWVtYmVyL2xvZ2luLnBocD9haWQ9bmV0LXNlcnZpY2UiPmh0dHBzOi8vd2FpY3V5ZGwu
Y24vbWVtYmVyL2xvZ2luLnBocD9haWQ9bmV0LXNlcnZpY2U8L0E+PEJSPuOBlOeiuuiqjeOCkuOB
hOOBn+OBoOOBkeOBquOBhOOBhOWgtOWQiOOAgeOBlOWIqeeUqOOBruWPo+W6p+OBq+WItumZkOOB
jOOBi+OBleOCjOOCi+aBkOOCjOOBjOOBlOOBluOBhOOBvuOBmeOBruOBp+OAgeS6iOOCgeOBlOS6
huaJv+S4i+OBleOBhOOAgjxCUj7jgYrlrqLmp5jjgavjga/jgZTov7fmg5HjgZTlv4PphY3jgpLj
gYrmjpvjgZfjgIHoqqDjgavnlLPjgZfoqLPjgZTjgZbjgYTjgb7jgZvjgpPjgII8QlI+LS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTxCUj7jgJDjg6Hjg7zjg6vjga7lhoXlrrnjgavouqvjgavopprjgYjj
gYzjgarjgYTloLTlkIjjgJE8QlI+5pys44Oh44O844Or44Gr5a++44GZ44KL44Oh44O844Or44Gn
44Gu44GU6L+U5L+hwrfjgYrllY/jgYTlkIjjgo/jgZvjga/jgYrlj5fjgZHjgZfjgabjgYrjgorj
gb7jgZvjgpPjgILjg6Hjg7zjg6vjga7lhoXlrrnjgavouqvjgavopprjgYjjgYzjgarjgYTloLTl
kIjjgoTjgIHjgrXjg7zjg5PjgrnnrYnjgavjgaTjgYTjgabjgY/jgo/jgZfjgY/nn6XjgorjgZ/j
gYTloLTlkIjjga/jgIHlvZPooYzjg5vjg7zjg6Djg5rjg7zjgrjjgpLjgZTopqfjgYTjgZ/jgaDj
gY/jgYvjgIHku6XkuIvjgojjgorpm7voqbHnlarlj7fjgpLnorroqo3jga7kuIrjgIHjgYrllY/j
gYTlkIjjgo/jgZvjgY/jgaDjgZXjgYTjgII8QlI+Jmd0OyZuYnNwOzxBIA0KaHJlZj0iaHR0cHM6
Ly93YWljdXlkbC5jbi9tZW1iZXIvbG9naW4ucGhwP2FpZD1uZXQtc2VydmljZSI+aHR0cHM6Ly93
YWljdXlkbC5jbi9tZW1iZXIvbG9naW4ucGhwP2FpZD1uZXQtc2VydmljZTwvQT48L1A+DQo8QlI+
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxCUj7nmbrooYw65qCq5byP5Lya56S+IA0KU01CQyBGaW5h
bmNlIFNlcnZpY2UgQ28uLCBMdGQuPEJSPuadseS6rOmDveWNg+S7o+eUsOWMuuS4uOOBruWGheS4
gOS4geebrjHnlaoy5Y+3PEJSPuWKoOWFpeWNlOS8miANCuaXpeacrOiovOWIuOalreWNlOS8mjxC
Uj7jgIDjgIDkuIDoiKznpL7lm6Pms5XlhaXph5Hono3lhYjnianlj5blvJXmpa3ljZTkvJo8QlI+
44CA44CA5LiA6Iis56S+5Zuj5rOV5Lq656ys5LqM56iu6YeR6J6N5ZWG5ZOB5Y+W5byV5qWt5Y2U
5LyaPEJSPuacrOODoeODvOODq+OBruWGheWuueOCkueEoeaWreOBp+W8leeUqOOAgei7oui8ieOB
meOCi+OBk+OBqOOCkuemgeOBmOOBvuOBmeOAgjxCUj48L1A+PC9CT0RZPjwvSFRNTD4NCg==
