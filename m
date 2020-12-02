Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA432CC1C3
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  2 Dec 2020 17:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162F6EA5F;
	Wed,  2 Dec 2020 16:12:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69306EA5F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  2 Dec 2020 16:12:09 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l206so2082979oif.12
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 02 Dec 2020 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b7U+AtH3sHJCwULgF3Ak2zaylddojTI/suVTwKzdZWQ=;
 b=ErkznRm8nwyDwIv/teBX3kIGhYer5ymPEKwvJsdCdOtk8J4E7h/F3yCSi6j6g1DF16
 QNktpzqHai+xd8PZl1R6oZG5x85KWxlLqDYBViXHEnNi/P+B0na/wfRKGm44ZG5N/O9f
 iuVGC/9e8BeIhC2ONpm4mwzqHxjarImNxVGjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b7U+AtH3sHJCwULgF3Ak2zaylddojTI/suVTwKzdZWQ=;
 b=a3eIksKCVBDO7/T3DWsomVk4WRVpq02n3m6vCaNX7Hsa9QJ1M+b9OMjgzx2fFFtbTt
 bTcYkaM8fJY8nEjp8UxUq3VxxrFxXbuWEb5N/YgXhAH+Vybm9qIcQqoCZNMyUs7wTEjW
 kMHFXU8z5Urte93k7ICVebJN7gqVxcmEDla96cqyBYRGfa0kHCrOIFhTzSdFnuRiO1El
 /rNqwqaYwmgFxpADmxElX5lt7gXOPDtZpW7FrPluu6wY6uUbGMw5sCHDL8FydCDSyRJC
 gkVpOj1PJBQ4ZWW7ca8cRq34dz7+eRLXq/AFTicSV5vg7f+Wyr8lzAh+sxcF9oZOm2rM
 KChQ==
X-Gm-Message-State: AOAM533ageEzc03qlYjO4wb79LlqymHWPuhfAB8x1r/mdLBLszBP3KoG
 /zTiurk0U7/uKSxtjwb3xW2WGL3psmiWV0X4zC2AOfCOKIgUDw==
X-Google-Smtp-Source: ABdhPJx9RB1NjUkHWVxMa5djDpF+EBlvksgp+1DOxJnboQAoZm7YjyEK65yCvt1oK3P9tLuw+YHUz+WWcB0lD2pn7Hg=
X-Received: by 2002:aca:1713:: with SMTP id j19mr2044644oii.101.1606925003642; 
 Wed, 02 Dec 2020 08:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
 <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
In-Reply-To: <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Dec 2020 17:03:11 +0100
Message-ID: <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
To: Zack Rusin <zackr@vmware.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCA0OjM3IFBNIFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5j
b20+IHdyb3RlOgo+Cj4KPgo+ID4gT24gRGVjIDIsIDIwMjAsIGF0IDA5OjI3LCBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPgo+ID4gSGkKPiA+Cj4gPiBB
bSAwMi4xMi4yMCB1bSAwOTowMSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+ID4+IEhpCj4g
Pj4gQW0gMzAuMTEuMjAgdW0gMjE6NTkgc2NocmllYiBaYWNrIFJ1c2luOgo+ID4+Pgo+ID4+Pgo+
ID4+Pj4gT24gTm92IDI0LCAyMDIwLCBhdCAwNjozOCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IFVzaW5nIHN0cnVjdCBkcm1fZGV2
aWNlLnBkZXYgaXMgZGVwcmVjYXRlZC4gQ29udmVydCB2bXdnZnggdG8gc3RydWN0Cj4gPj4+PiBk
cm1fZGV2aWNlLmRldi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+ID4+Pj4KPiA+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+Pj4g
Q2M6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgo+ID4+Pj4gLS0tCj4g
Pj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyB8ICA4ICsrKystLS0t
Cj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICB8IDI3ICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCj4gPj4+PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9mYi5jICAgICB8ICAyICstCj4gPj4+Cj4gPj4+IFJldmlld2VkLWJ5OiBaYWNrIFJ1c2luIDx6
YWNrckB2bXdhcmUuY29tPgo+ID4+IENvdWxkIHlvdSBhZGQgdGhpcyBwYXRjaCB0byB0aGUgdm13
Z2Z4IHRyZWU/Cj4gPgo+ID4gQU1EIGRldnMgaW5kaWNhdGVkIHRoYXQgdGhleSdkIHByZWZlciB0
byBtZXJnZSB0aGUgcGF0Y2hzZXQgdHJvdWdoIGRybS1taXNjLW5leHQuIElmIHlvdSdyZSBPSyB3
aXRoIHRoYXQsIEknZCBtZXJnZSB0aGUgdm13Z2Z4IHBhdGNoIHRocm91Z2ggZHJtLW1pc2MtbmV4
dCBhcyB3ZWxsLgo+Cj4gU291bmRzIGdvb2QuIEnigJlsbCBtYWtlIHN1cmUgdG8gcmViYXNlIG91
ciBsYXRlc3QgcGF0Y2ggc2V0IG9uIHRvcCBvZiBpdCB3aGVuIGl04oCZcyBpbi4gVGhhbmtzIQoK
YnR3IGlmIHlvdSB3YW50IHRvIGF2b2lkIG11bHRpLXRyZWUgY29vcmRpbmF0aW9uIGhlYWRhY2hl
cywgd2UgY2FuCmFsc28gbWFuYWdlIHZtd2dmeCBpbiBkcm0tbWlzYyBhbmQgZ2l2ZSB5b3UgJiBS
b2xhbmQgY29tbWl0IHJpZ2h0cwp0aGVyZS4gVXAgdG8geW91LiBUaGVyZSBpcyBzb21lIHNjcmlw
dGluZyBpbnZvbHZlZCBmb3Igbm93IChidXQgSSBob3BlCndoZW5ldmVyIHdlIG1vdmUgdG8gZ2l0
bGFiIHdlIGNvdWxkIGRvIHRoZSBjaGVja3Mgc2VydmVyLXNpZGUpOgoKaHR0cHM6Ly9kcm0ucGFn
ZXMuZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvZ2V0dGluZy1zdGFydGVkLmh0bWwK
CkNoZWVycywgRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
