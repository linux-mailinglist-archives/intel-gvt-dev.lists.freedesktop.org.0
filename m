Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHKjBvOrFWpuXgcAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2026 16:19:31 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4AC5D7556
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 May 2026 16:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649B510E68E;
	Tue, 26 May 2026 14:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CzfZQd0J";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6017E10E690
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2026 14:13:57 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a87782588cso3972712e87.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 May 2026 07:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779804835; cv=none;
 d=google.com; s=arc-20240605;
 b=BmlUrce4DRED6Mh4A4bibQ+MZUSvOk0nVtwhAZVE/NcwWBk9CtsbMR9Lb/riepqKGe
 yL9N7nNSC/4roMfIqHAn0r6S5Ybnqld7oZoh63ABhmyf8dMfIPtVoj0oF0QICbiAvS8i
 HF0CdSbuvkXPky8irjgNjfhdBcB4k/fGYLlWfpua6kqRQr6+HCCc9gcm/a0a3snQpS/H
 5T8DW4XOmDQfHaXbSC8YbFe5QA7rSpf9wLA1hVWGwB4OlTYYEI5dEt2tSAEs+rGNYPXj
 VegQnsTF/2qkVcSAgAsgLzOG15NycwZpvsQ3v+xHp9FEO7QFQOV3zwTM8F5fGEk71fjV
 dMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=CagB7YAGIZTfnT7FVMJzDu9+hPjkjeo8DuXfI0KVXcM=;
 fh=4ZS+2pTeWq42cl82vyZIe63vf7dYkH6fz6mlGfn50gI=;
 b=Tol7l3Q5RMZi5UuryIZyrn21ncCAu671MU3MjAqcvapNFi2LfCJJbeJSK5DP6dP2qa
 pC/F6DSWOT3rKy8LVUwEjffzxZ1kxhiO4K1KXDvRLMjGxJzTKKu6oymWjySAAmjZEaLw
 rZLccepQeXiz+jbCHQ7I26YHLOul4ehvR1uhikH8WjyU+wDPnNghmK70OWvJ5D/NtRM7
 cPz0ydY0E/QTCQ5fKbGWTzvxeseg+nLOk2BPzlMOC8mfiC2pPyM0hNdxXqEZYOeXwriJ
 agi2+WHn22K4I7y7rJS23TsjANNa2CLtDKnK+5RmMsQDpGMqvmMbglxHva8d8MPxmMd7
 6kDg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779804835; x=1780409635; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CagB7YAGIZTfnT7FVMJzDu9+hPjkjeo8DuXfI0KVXcM=;
 b=CzfZQd0JfXXlW/sHwaDI7h6C1hot+oKqzs20DAHBPW0TiYFiAFe3r0Rq3Ca6CbmZLE
 RnY0LoefUPL+W4RGQEQ28jwt+L0cwFm5yEYL1vc/0oKt6po6oBYDfiaBVRo0K6xhLzf3
 s5IV7RZXpXKvk9KmYBIbfja0JbHx5DYU4pRyNMsxTG+Y6depJbsDwELEzSjRxNqA4nMk
 PLycu0vFvjrpynRMK3VpqvjigAHPDg0sRauAkbkfnFIFjgE9cgU2+ghaYeJ7+p/UPTlf
 yaeI7WKCC8oVvwFbKz98sKmyArXomLvVrYthDD1LEl5Sxebo0IOlW92ca4E1v/pvFCHU
 GBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779804835; x=1780409635;
 h=to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CagB7YAGIZTfnT7FVMJzDu9+hPjkjeo8DuXfI0KVXcM=;
 b=dFsZQo//zu3v8DKgtTQIg/TeWTh6KRrhg3StX9QN7YC2EEsNP1ZBEFcZwrSvjxs7HJ
 esN6zxbqV/Q3leXYMBu98qOPfmNtKLCpeBKhFAuD73TcrBy1IlTavftQ6PfQ6yMOxZGT
 rcR4tj5tbgyRnFvPQ4lcAwuZERSRzQHgS8Tk/jnYai68gVoA+kxtXA+oaavPqB115obr
 VgIcaL/H3Yv1p5VgW+8v+O4AjoFoQo8GBvh0ghq23a9Bq57Aw45XCi02Xfa5oE6kjKqE
 wi8phxzxi909efOZUTpMs7JpfgVHHmrjQkiTUYIh4ESHhLs1Q57DctCn1ZiqtA1Erh71
 RL+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8O/7MiCIKomMqMOfIii0VZZdGaYWyf+sXAFMi/yCT3pYhSDb0b7KWPS1+4vba1GSAX/3FJTkrX/8ogw+bl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE4cDj6YIgDRZfvPaFMrKA3QDon4w5w06/beR7V0o5BMHK+uc8
 B51TRENkW8ECEFljnlnJIg85iARjVbp19ZUB4/3LF/S9JC/YYqj1qhbycxBGS0qHVW2ZJR4wSR7
 7kBXP6X3UxHrsKJOOdc1/5GTYuyCzocg=
X-Gm-Gg: Acq92OFYll7p6njKQMmbBG8wgGKwkcEGPscjq0WlO2pj9hVGj3niJVm5U77HHxvr2pf
 pQAlqE1tDju/2jhrQ5CDXd0ZseJehAhDKGoKARo/AC4yPXPJKkzC3mjyD8qZS7wZv4V+PLRLFjZ
 +iJkVsCB4eiu+NoC6/MOtmYEsIhBMiySfd2jGYc1Ok2zAPnEZnP/sF3fdOuUcdLN9vHsgLsFwWx
 zzd/cl4DL3t5juCKfnDzksCj+E9be3Eh7EU8O0TZ3k8TMSaNsa8YQW89iyutt0TBgMLXr22gqhb
 lmI5T8NCY9ufjDdwcu0u6SSSV8fRcgvvYtjfUhnZ9OBS
X-Received: by 2002:a05:6512:3ba8:b0:5a8:778b:7df8 with SMTP id
 2adb3069b0e04-5aa323a9070mr5141167e87.40.1779804834982; Tue, 26 May 2026
 07:13:54 -0700 (PDT)
MIME-Version: 1.0
From: "MR.OWEN JAMES" <marvelouspaulups@gmail.com>
Date: Tue, 26 May 2026 15:13:43 +0100
X-Gm-Features: AVHnY4LHwlz8bgCVvVgiQ4rWCd-i_Teom7RqVuCBt2v5DAKSoa6ELUKcMaZq918
Message-ID: <CAOC4BXDP2=za2o+ocTk6kp8cpYMT1SOX-4nj283et=GvLwOBqw@mail.gmail.com>
Subject: TRANSACTION CONFIRMATION NEEDED
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000f5708f0652b91afa"
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
Reply-To: davidburgerlucas@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [10.02 / 15.00];
	FREEMAIL_AFF(4.00)[];
	R_UNDISC_RCPT(3.00)[];
	SUBJ_ALL_CAPS(2.33)[31];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	FROM_NAME_HAS_TITLE(1.00)[mr];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[marvelouspaulups@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	NEURAL_SPAM(0.00)[0.812];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_ALL(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marvelouspaulups@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[davidburgerlucas@gmail.com];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 7A4AC5D7556
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--000000000000f5708f0652b91afa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

--=20















*I=E2=80=99m Mr. Owen James your account manager from STANDARD CHARTERED BA=
NK.This
message is to confirm if the owner of this fund is dead or alive. last week
One Mr. Frank S. Anderson claimed his your next of kin and trying claim the
sum of $10.8 million dollars and your brand new car BMW 4 Series Gran Coup=
=C3=A9
(G26 generation)2022 model, he said you died on a car accident if this is
not true then Kindly reconfirm your information for proper clarification
and to avoid wrong delivery =F0=9F=9A=9A. Your full name ______Your home ad=
dress
_____Direct phone number _____Name of your nearest airport _____For more
information kindly respond to this email or reach out to us through this
number or e-mail below:Number: +1(617) 407 7927Email:
davidburgerlucas@gmail.com <davidburgerlucas@gmail.com>We await your swift
response THANK YOU =F0=9F=99=8F=F0=9F=8F=BE *

--000000000000f5708f0652b91afa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div><br></div><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><b><font size=3D=
"4">I=E2=80=99m Mr. Owen James your account manager from STANDARD CHARTERED=
 BANK.<br>This message is to confirm if the owner of this fund is dead or a=
live. <br>last week One Mr. Frank S. Anderson claimed his your next of kin =
and trying claim the sum of $10.8 million dollars and your brand new car BM=
W 4 Series Gran Coup=C3=A9 (G26 generation)2022 model, he said you died on =
a car accident if this is not true then Kindly reconfirm your information f=
or proper clarification and to avoid wrong delivery =F0=9F=9A=9A. <br>Your =
full name ______<br><br>Your home address _____<br><br>Direct phone number =
_____<br><br>Name of your nearest airport _____<br><br>For more information=
 kindly respond to this email or reach out to us through this number or e-m=
ail below:<br>Number: +1(617) 407 7927<br>Email: <a href=3D"mailto:davidbur=
gerlucas@gmail.com" target=3D"_blank">davidburgerlucas@gmail.com</a><br>We =
await your swift response <br>THANK YOU =F0=9F=99=8F=F0=9F=8F=BE=C2=A0</fon=
t></b><br></div></div></div>

--000000000000f5708f0652b91afa--
