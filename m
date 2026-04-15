Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LCxBDO432mOYQAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2026 18:09:23 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382C40646E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2026 18:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E00910E04F;
	Wed, 15 Apr 2026 16:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OnaFWkYp";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5163610E04F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2026 16:00:07 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8d67a483d3eso746931985a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2026 09:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776268806; cv=none;
 d=google.com; s=arc-20240605;
 b=CtFLo5g8gdF1X+GtGtdbdTl7+qNtv2V95+UnfGOZ44vaTgJGCGkiWbCAx4NiMvQ17p
 ANCN33AgMP3UCloEm/oMbGlSHCseB2gcDrc11pNMZsYPS5VUfbr2NVo4ekhIOdfIvig4
 veQpxD6PqTuPDnRChcWQAaD2FSggAZnUyE+iNjVnyPt84HJ/lmLcl9VIxr+llrgGEsAK
 HWvm8T2EZV33xmT14z/TRcvOTr01pcWwxwhYkgoKQ2eXWhj0GuDWqhHQWh4Wy4gPzgB0
 ov3Bd2mhRx52Dz76cmETlo40P307uust0gQHf1bsM/o0boy6fn1crfpWOEaeIEm5lfY/
 o9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=6C4SZBZSBdMem+0aigHG2XtXi1W+y0y8mRxhRxYHG6g=;
 fh=7hIfKIO5tqNTmMictHGo16r9V75RtPNtSnjFbdBqbrE=;
 b=Q2MjXZUfB1ddG1hxIfcowK6b1Vg0ltl4vR864XFT2+7cl06Ho0hsrXYN3U1OSirdum
 rNZMyvafIHKFbpdwnmtqaBjKikx58A23DAxsDsEiwNM7lc1UkL/aoSDr3mfYVqqRzFHp
 VhNMwkXylE7zZU0PSnHnsGcW7b+XBYKk0m2/FAlctoIZzmQGbU1bR4rvPzNwmE1j25UC
 89GMrHp8U2wKsptIP9kOr0yJCx0+vl6nopZo2JaVHGmAInekS5I06Vog9hkE5QUf9L9M
 VnxoRo1YfUJSVt21LH2eisDUfw3KWYu7xliQGWY+UtG8VP522a0/xQg+6j9ihjThgay1
 BqQQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776268806; x=1776873606; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6C4SZBZSBdMem+0aigHG2XtXi1W+y0y8mRxhRxYHG6g=;
 b=OnaFWkYpc5KTNQIuR27Zbw257YCtMGRRsnRPpl3WHvBGKiM+/3zAWxJDGARK09jpFW
 +tFGeKZ7NxZFQXGyQe+S5Mj/OWIP8a0EAXDYFxtQra90Mf16nm2yPtiGdsEm/pUozCxG
 da9Madau9A70GjVIvbq8vaBfCBB8RBY5kXE3Tntjrdt/yAlChtd8uXlEt6/K3rnSEKGj
 G6G+hlr0MRa4GEpNUqEfOPD6B/YXmSjdDXPsUfMEWBYnXFbV6PZSkrF7YPaAHqIQbLWr
 ZXZIi/Xq7RDB111tCRkqSMvLBdlI+u2sMtb2KDuAyoLj3v37FjBkpi3zhFdP8kzyHqvX
 rlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776268806; x=1776873606;
 h=to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6C4SZBZSBdMem+0aigHG2XtXi1W+y0y8mRxhRxYHG6g=;
 b=C64jRo1tBa3itJ6x3eJezZd9QNBVmulS7PtU68Lp3izmeP/DKv4VdM4WDeFdQKtbY3
 wrPVuffIb9E7KdZcwSy8p843xGy8lmxIJpXtu2S/kI/10a7oOqI8fNImmHBfLqp+xJNv
 48zqJ1INiaonPlETq403wuBNbh9SjVH8+MSwIw55EhVfni+Cu2+S3lLG5i8PKRZRC8+7
 g0zANcNJFN6LpjzKTx5IC5enlJAg5UDDK6BMUex/8seVcEqZI7P466auIJhw0620wQ/9
 tXsO4HhAwmp47FAXjpCz/eReamhBY6md9buLSm7tE4ntSLIeMn8scVxMg/XGl+N/W7Rf
 ws7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lFNrabt3X1nI6UJzrtHlPVxvDA4Gc3PNDKxvOZSitPW6poR83jLfkxNoddg3Nrrlou0zA5NUl/t1W207H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnxIc+NvYQYscNPXuJsBnEOZoqROYWW1+HHcJ23Ko1QFfKl6o8
 HnY9IK2is5GTcvn0gYQt1rDYuWMOQkXpqjMFoRveyotgtXm7NMOvkFrPmSqCWUEIPxmQ8OtGz85
 UYLOlGUzVkHCMfQ8oaz0Ev+2QiEuPE0g=
X-Gm-Gg: AeBDietbrE8dJDd0yG0/FWP2ZXFr9czZeQYiHrWSwe5ZvL+4g8TpXDw8mG1bnjCQxHt
 f4kNuCMIHPGzHZeX5R576jSMA4JkOxE8Q+U/IjJza0QauKO915v8++GxYAlXXoZRqzaWqsjzpMA
 BFLH7MO7BT9XZOtPPtLXo8FVWSVhfxCOCBXN1kt/8zsxWgOFAMrEy2vzsHpGAA8ACw+z2VZyMBO
 eE2z9LKJSIFSarIR9AeZIni9pwySHbWM0HEOocJ83tPtf9uTJClitPHk8N16aVHam0BRehzAtcC
 p9c7g8SA+5pxQoodmUO5w0QKH234rW9ukEA53MyX70F6xkKTjW1h+zM=
X-Received: by 2002:a05:620a:440d:b0:8cf:eafc:b7c with SMTP id
 af79cd13be357-8ddcf1b9b62mr3224353185a.41.1776268805964; Wed, 15 Apr 2026
 09:00:05 -0700 (PDT)
MIME-Version: 1.0
From: "steveantonio225@gmail.com" <steveantonio225@gmail.com>
Date: Wed, 15 Apr 2026 16:57:33 -0700
X-Gm-Features: AQROBzA-M00dnULNKVq-qMd6k9PSrmg4XcIGUnbp-ec_QvAZUO9OSuQYBg0jc0M
Message-ID: <CAK_fj3jjhVxXHK_meZXPi2=tPxCF-7g27s8dyAEWM5e4OW9ECA@mail.gmail.com>
Subject: =?UTF-8?B?RE9CUsOJIFpQUsOBVlkgWiBNTUY=?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003489bb064f81cf40"
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
Reply-To: steveantonio225@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [7.14 / 15.00];
	DATE_IN_FUTURE(4.00)[7];
	R_UNDISC_RCPT(3.00)[];
	SUBJ_ALL_CAPS(1.35)[18];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[steveantonio225@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	HAS_REPLYTO(0.00)[steveantonio225@gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steveantonio225@gmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8382C40646E
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--0000000000003489bb064f81cf40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VXBvem9ybsSbbsOtOiBWbGFzdG7DrWsgZS1tYWlsb3bDqSBhZHJlc3ksDQpWIG7DoXZhem5vc3Rp
IG5hIHNjaMWvemt1IHMgRmVkZXLDoWxuw61tIMO6xZlhZGVtIHBybyB2ecWhZXTFmW92w6Fuw60g
KEZCSSkNCk1lemluw6Fyb2Ruw60gbcSbbm92w70gZm9uZCAoTU1GKSBvZMWha29kxYh1amUgdsWh
ZWNobnkgb2LEm3RpIMSNw6FzdGtvdSA4MDAgMDAwLDAwDQpVU0QgYSBuxJtrdGVyw6kgdcW+aXZh
dGVsZSBlLW1haWzFrywgamVqaWNoxb4gam3DqW5vIGEgZS1tYWlsb3bDoSBhZHJlc2EgYnlseQ0K
bmFsZXplbnkgdiBzZXpuYW11LiBTb3VobGFzaWxpIGpzbWUgdsWhYWsgcyBwxZlldm9kZW0gdmHF
ocOtIHZsYXN0bsOtIHBsYXRieQ0KYmFua292bsOtbSBwxZlldm9kZW0uDQpBYnlzdGUgc2UgdsWh
YWsgdnlobnVsaSBjaHliw6FtIHDFmWkgcGxhdGLEmywgZG9wb3J1xI11amVtZSB2w6FtIHphc2xh
dA0KcG90xZllYm7DqSBpbmZvcm1hY2UgdXZlZGVuw6kgbsOtxb5lLCBhYnljaG9tIHbDoW0gbW9o
bGkgcGxhdGJ1IHDFmWV2w6lzdCBqZcWhdMSbDQpkbmVzLg0KVmHFoWUgY2Vsw6kgam3DqW5vIF9f
X19fX18NCk7DoXpldiBiYW5reSBfX19fX19fDQpCYW5rb3Zuw60gw7rEjWV0IF9fX19fDQpTV0lG
VCBrw7NkIF9fX19fDQpBZHJlc2EgdmHFocOtIGJhbmt5IF9fX19fX18NClZhxaFlIHplbcSbIF9f
X19fX18NClRlbGVmb25uw60gxI3DrXNsbzogX19fX18NClRlbGVmb25uw60gxI3DrXNsbyBtdXPD
rSBiw710IHBsYXRuw6ksIGFieXN0ZSBtb2hsaSBkb3N0w6F2YXQgdXBvem9ybsSbbsOtIG5hDQpw
xZlldm9kLiBEYWzFocOtIGluZm9ybWFjZSBvIHRvbSwgamFrIHbDoXMgb2JkcsW+ZXTigKYNCg==
--0000000000003489bb064f81cf40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VXBvem9ybsSbbsOtOiBWbGFzdG7DrWsgZS1tYWlsb3bDqSBhZHJlc3ks
PGJyPlYgbsOhdmF6bm9zdGkgbmEgc2Noxa96a3UgcyBGZWRlcsOhbG7DrW0gw7rFmWFkZW0gcHJv
IHZ5xaFldMWZb3bDoW7DrSAoRkJJKSBNZXppbsOhcm9kbsOtIG3Em25vdsO9IGZvbmQgKE1NRikg
b2TFoWtvZMWIdWplIHbFoWVjaG55IG9ixJt0aSDEjcOhc3Rrb3UgODAwIDAwMCwwMCBVU0QgYSBu
xJtrdGVyw6kgdcW+aXZhdGVsZSBlLW1haWzFrywgamVqaWNoxb4gam3DqW5vIGEgZS1tYWlsb3bD
oSBhZHJlc2EgYnlseSBuYWxlemVueSB2IHNlem5hbXUuIFNvdWhsYXNpbGkganNtZSB2xaFhayBz
IHDFmWV2b2RlbSB2YcWhw60gdmxhc3Ruw60gcGxhdGJ5IGJhbmtvdm7DrW0gcMWZZXZvZGVtLjxi
cj5BYnlzdGUgc2UgdsWhYWsgdnlobnVsaSBjaHliw6FtIHDFmWkgcGxhdGLEmywgZG9wb3J1xI11
amVtZSB2w6FtIHphc2xhdDxicj5wb3TFmWVibsOpIGluZm9ybWFjZSB1dmVkZW7DqSBuw63FvmUs
IGFieWNob20gdsOhbSBtb2hsaSBwbGF0YnUgcMWZZXbDqXN0IGplxaF0xJsgZG5lcy48YnI+VmHF
oWUgY2Vsw6kgam3DqW5vIF9fX19fX188YnI+TsOhemV2IGJhbmt5IF9fX19fX188YnI+QmFua292
bsOtIMO6xI1ldCBfX19fXzxicj5TV0lGVCBrw7NkIF9fX19fPGJyPkFkcmVzYSB2YcWhw60gYmFu
a3kgX19fX19fXzxicj5WYcWhZSB6ZW3EmyBfX19fX19fPGJyPlRlbGVmb25uw60gxI3DrXNsbzog
X19fX188YnI+VGVsZWZvbm7DrSDEjcOtc2xvIG11c8OtIGLDvXQgcGxhdG7DqSwgYWJ5c3RlIG1v
aGxpIGRvc3TDoXZhdCB1cG96b3JuxJtuw60gbmEgcMWZZXZvZC4gRGFsxaHDrSBpbmZvcm1hY2Ug
byB0b20sIGphayB2w6FzIG9iZHLFvmV04oCmPC9kaXY+DQo=
--0000000000003489bb064f81cf40--
