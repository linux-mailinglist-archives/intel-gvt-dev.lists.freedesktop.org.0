Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3456AC3EA
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  7 Sep 2019 03:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F096E148;
	Sat,  7 Sep 2019 01:35:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EDD6E148
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  7 Sep 2019 01:35:12 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id h23so2650623uao.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 06 Sep 2019 18:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=C+0rVi6PzTMFYTcbcIBgVtgcdKuod3fbgGTlJ3s1Cbc=;
 b=G9GvLBI90dEeEYx7PlQnPgZjUXBlHejwBULXvTkiMGEiRk0wTVCs1HJ+TxKep5zYHm
 SwvVkEMzVFN5KR85OAK3HL6ZsERh0iEJZRZgE5ir6WZk+3TBLwTZ8YO0Y97HutZ/ewsa
 fPblL6XRqxT181wio4C6VGFHCqg5oEg9r4BFxuG/c0cr5xhH9ZK/6945oYm/swpHd8Fg
 d5gL453XPM8yaQ4I0E7+WbNTWuK3+DQ1HRmBn5gADvKYhk0xL2OtdTY6t+gOdwV9XiLo
 GyqosCUQ5uchdnHBX5EDAdVEfL2HcKNG17HhUhzZWoYKcGcElhuuOFG38TDPLb2z/hPG
 BDgQ==
X-Gm-Message-State: APjAAAX44gkxHY6J+t8lOh9/iOliBh25ycx7sUBEN/d2mMnjJci/gGKx
 6ixRU4AWKTcagFGIEYh9s1e83dA5Y7rj7GHZqU0=
X-Google-Smtp-Source: APXvYqzIxIMwMyRCdkgO6FHpzJDn+KCJvm1DeQX+OomspEdZOmJGFau2SVPHiJ3fDRYvRmAdV0kRwG1eq44EUYIUEm0=
X-Received: by 2002:a9f:309a:: with SMTP id j26mr5722816uab.60.1567820111785; 
 Fri, 06 Sep 2019 18:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:c545:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 18:35:11 -0700 (PDT)
From: Alice Walton <saraharmony501@gmail.com>
Date: Sat, 7 Sep 2019 02:35:11 +0100
Message-ID: <CAHoQAbXwSKX9aVsDZz8aqqzPygpAEXmzYtiu5ogDXC9xJMf55w@mail.gmail.com>
Subject: Please forgive me
To: undisclosed-recipients:;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=C+0rVi6PzTMFYTcbcIBgVtgcdKuod3fbgGTlJ3s1Cbc=;
 b=LDeLoKrgQnhTkRoGE0qHkNXA77KSUk6LqEq23v4a+InO+HdoYRAa0tuV1WhlJaOduo
 I3Pd55j4aiR8h9Ura1I9gi5apYG8aoprP1KWJ1bsR6Nq6NsrJJMv0EoAJjRwIKEDMuqN
 QLX4QjLNLFDgzPRH00kQ0su0FDMNY0cjW5wJED82HjNqcOxVFQWjFjL1arpanoFhJIj8
 8W1C79/WdydgdyiFzQjGp2fy5D+JzJV9RoSsGpw8tgFG2+RccwvP3dkbp23+MKXMpXG1
 2n+ghMYlH7q4JMGO9Qx81QyIUn7evwhtm8tpfMs/5KZmzhx0NPpo9AWYsGub2zlLag34
 dx3g==
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: waltonalice41@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TXkgRGVhcmVzdCwKClBsZWFzZSBmb3JnaXZlIG1lIGZvciBzdHJlc3NpbmcgeW91IHdpdGggbXkg
cHJlZGljYW1lbnRzIGFzIEkga25vdwp0aGF0IHRoaXMgbGV0dGVyIG1heSBjb21lIHRvIHlvdSBh
cyBhIGJpZyBzdXJwcmlzZS4KCkFjdHVhbGx5LCBJIGNhbWUgYWNyb3NzIHlvdXIgRS1tYWlsIGZy
b20gbXkgcGVyc29uYWwgc2VhcmNoIGFmdGVyd2FyZApJIGRlY2lkZWQgdG8gZW1haWwgeW91IGRp
cmVjdGx5IGJlbGlldmluZyB0aGF0IHlvdSB3aWxsIGJlIGhvbmVzdCB0bwpmdWxmaWwgbXkgZmlu
YWwgd2lzaCBiZWZvcmUgYW55dGhpbmcgaGFwcGVucyB0byBtZS4gTWVhbndoaWxlLCBJIGFtCk1h
ZGFtIEFsaWNlIFdhbHRvbiwgNzEgeWVhcnMgb2xkIGNoaWxkbGVzcyB3aWRvdyBmcm9tIEZyYW5j
ZSBidXQgaQpyZXNpZGUgYW5kIGRvaW5nIEdvbGQgbWluaW5nIGJ1c2luZXNzIGluIEFmcmljYSBi
ZWZvcmUgaSBmYWxsIHNpY2suCgpJIGFtIHN1ZmZlcmluZyBmcm9tIEFkZW5vY2FyY2lub21hIENh
bmNlciBvZiB0aGUgbHVuZ3MgZm9yIHRoZSBwYXN0IDgKeWVhcnMgYW5kIGZyb20gYWxsIGluZGlj
YXRpb24gbXkgY29uZGl0aW9uIGlzIHJlYWxseSBkZXRlcmlvcmF0aW5nIGFzCm15IGRvY3RvcnMg
aGF2ZSBjb25maXJtZWQgYW5kIGNvdXJhZ2VvdXNseSBhZHZpc2VkIG1lIHRoYXQgSSBtYXkgbm90
CmxpdmUgYmV5b25kIDMgd2Vla3MgZnJvbSBub3cgZm9yIHRoZSByZWFzb24gdGhhdCBteSB0dW1v
ciBoYXMgcmVhY2hlZAphIGNyaXRpY2FsIHN0YWdlIHdoaWNoIGhhcyBkZWZpbGVkIGFsbCBmb3Jt
cyBvZiBtZWRpY2FsIHRyZWF0bWVudC4KClNpbmNlIG15IGRheXMgYXJlIG51bWJlcmVkLCBJ4oCZ
dmUgZGVjaWRlZCB3aWxsaW5nbHkgdG8gZnVsZmlsIG15CmxvbmctdGltZSB2b3cgdG8gZG9uYXRl
IHRvIHRoZSBsZXNzIHByaXZpbGVnZXMgdGhlIHN1bSBvZigkMTguNQptaWxsaW9uIGRvbGxhcnMp
IEkgZGVwb3NpdGVkIGluIG15IG9mZnNob3JlIGFjY291bnQgb3ZlciA3IHllYXJzIG5vdwpiZWNh
dXNlIEkgaGF2ZSB0cmllZCB0byBoYW5kbGUgdGhpcyBwcm9qZWN0IGJ5IG15c2VsZiBidXQgSSBo
YXZlIHNlZW4KdGhhdCBteSBoZWFsdGggY291bGQgbm90IGFsbG93IG1lIHRvIGRvIHNvIGFueW1v
cmUuCgpNeSBwcm9taXNlIHRvIEdvZCBpbmNsdWRlcyBidWlsZGluZyBvZiB3ZWxsLWVxdWlwcGVk
IGNoYXJpdHkKZm91bmRhdGlvbi9ob3NwaXRhbCBhbmQgYSB0ZWNobmljYWwgc2Nob29sIGZvciB0
aGUgb3JwaGFucyBhbmQgbGVzcwpwcml2aWxlZ2VzLgoKU2luY2UgaSBhbSBub3QgY2FwYWJsZSB0
byBoYW5kbGUgdGhpcyBhZ2FpbiBteXNlbGYgZHVlIHRvIG15IGNyaXRpY2FsCmhlYWx0aCBjb25k
aXRpb24scGxlYXNlIGkgbmVlZCB5b3VyIGNvbnNlbnQgdG8gaGVscCBtZSByZWNlaXZlIG15Cm1v
bmV5IGZyb20gdGhlIGJhbmsgYW5kIHVzZSBpdCB0byBkbyB0aGlzIGRpdmluZSB3b3JrcyBvZiBH
b2QgaW4geW91cgpjb3VudHJ5IGluIG15IG5hbWUgc28gdGhhdCBteSBzb3VsIGNhbiBiZSBhdCBy
ZXN0IGlmIGFueXRoaW5nIGhhcHBlbnMKdG8gbWUuCgpJZiB5b3Ugd2lsbCBiZSBob25lc3QsIGtp
bmQgYW5kIHdpbGxpbmcgdG8gYXNzaXN0IG1lIGhhbmRsZSB0aGlzCmNoYXJpdHkgcHJvamVjdCBh
cyBJ4oCZdmUgbWVudGlvbmVkIGhlcmUsIEkgd2lsbCBsaWtlIHlvdSB0byBwcm92aWRlIG1lCnlv
dXIgcGVyc29uYWwgZGF0YSBsaWtlLAoKKDEpIFlvdXIgZnVsbCBuYW1lOgooMikgY291bnRyeToK
KDMpIE9jY3VwYXRpb246Cig0KSBwaG9uZSBudW1iZXI6Cig1KSBBZ2U6CgpMZXQgbWUgaGF2ZSB0
aGlzIGRhdGEgc28gdGhhdCBpIGNhbiBsaW5rIHlvdSB1cCB3aXRoIG15IGJhbmsgYXMgbXkKcmVw
cmVzZW50YXRpdmUgYW5kIHJlY2VpdmVyIG9mIHRoZSBmdW5kcyBub3cgdGhhdCBpIGFtIHN0aWxs
IGFsaXZlLgoKV2FybWVzdCBSZWdhcmRzIQpNcnMuIEFsaWNlIFdhbHRvbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
