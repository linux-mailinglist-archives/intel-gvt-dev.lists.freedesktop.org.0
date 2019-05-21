Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42F424DAD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 13:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B89B891EB;
	Tue, 21 May 2019 11:11:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65D891EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 May 2019 11:11:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F94F883CA;
 Tue, 21 May 2019 11:11:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 102A1176D4;
 Tue, 21 May 2019 11:11:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F07FB11AB8; Tue, 21 May 2019 13:11:43 +0200 (CEST)
Date: Tue, 21 May 2019 13:11:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 21 May 2019 11:11:45 +0000 (UTC)
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 ville.syrjala@linux.intel.com, zhiyuan.lv@intel.com, daniel@ffwll.ch,
 kalyan.kondapally@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSW4ta2VybmVsIGRpcmVjdCBmbGlwOgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiBXaXRoICJlbmFibGVfZGlyZWN0X2ZsaXAiIHN3aXRjaGVkIG9uLCBkdXJpbmcgdkdQVSBwYWdl
IGZsaXAsIEdWVC1nIHdpbGw6Cj4gCj4gMSkgRmluZCBvdXQgdGhlIGFzc2lnbmVkIEhXIHBsYW5l
cy4KPiBHVlQtZyBpcyB0aGUgb3duZXIgb2YgdGhlIEk5MTVfR0VNX09CSkVDVF9JU19QUk9YWSBH
RU0gd2hpY2ggaXMgZXhwb3NlZCBieQo+IEdWVC1nIHdpdGggZG1hLWJ1ZiBpbnRlcmZhY2UuIAo+
IAo+IEdWVC1nIHNjYW4gdGhlIGZyYW1lYnVmZmVycyBzZXQgb24gdGhlIGFjdGl2ZSBwbGFuZXMg
dG8gc2VlIGlmIHRoZXJlIGFyZSBzb21lCj4gZnJhbWVidWZmZXJzIHdpdGggSTkxNV9HRU1fT0JK
RUNUX0lTX1BST1hZIEdFTS4KPiAKPiBBIEhXIHBsYW5lIHVzaW5nIGEgZnJhbWVidWZmZXIgd2l0
aCBJOTE1X0dFTV9PQkpFQ1RfSVNfUFJPWFkgR0VNIGlzIGNvbnNpZGVyZWQKPiBhcyBhbiBhc3Np
Z25lZCBwbGFuZS4gR1ZULWcgZ2V0cyB0aGUgYXNzaWdubWVudCBpbmZvcm1hdGlvbiB0aHJvdWdo
IGd2dF9pbmZvCj4gc3RydWN0dXJlIG9mIHRoZSBJOTE1X0dFTV9PQkpFQ1RfSVNfUFJPWFkgR0VN
Lgo+IAo+IDIpIERlY29kZSB2R1BVJ3MgZnJhbWVidWZmZXIgaW5mbyBhbmQgdXNlIHRoYXQgdG8g
dXBkYXRlIHRoZSBzaGFkb3cgZnJhbWVidWZmZXIuCj4gCj4gMykgQ29tbWl0IHRoZSBzaGFkb3cg
ZnJhbWVidWZmZXIgdGhyb3VnaCAiZHJtX2F0b21pY19jb21taXQoKSIuCgpIbW0sIG5vIHVzZXJz
cGFjZSBBUEkgaW5jbHVkZWQgaW4gdGhpcyBwYXRjaCBzZXJpZXMuCgpUaGUgcWVtdSBicmFuY2gg
aGFzIGFuIHBhdGNoICh2ZmlvL2Rpc3BsYXk6IEludGVyZmFjZSBvZiBxdWVyeWluZwp0aGUgZmIg
aWQgb2YgdkdQVSdzIHBsYW5lKSB3aGljaCBpc24ndCBkb2N1bWVudGVkLgoKV2hhdCBpcyB0aGUg
cGxhbiBoZXJlPwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
