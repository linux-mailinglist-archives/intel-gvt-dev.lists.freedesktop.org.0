Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8A757BEF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 08:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619166E5AD;
	Thu, 27 Jun 2019 06:20:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7236E5AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 06:20:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F19034627A;
 Thu, 27 Jun 2019 06:20:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC13608CA;
 Thu, 27 Jun 2019 06:20:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7676611AAF; Thu, 27 Jun 2019 08:20:43 +0200 (CEST)
Date: Thu, 27 Jun 2019 08:20:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 2/4] vfio: Introduce vGPU display irq type
Message-ID: <20190627062043.63wpwgefbsnackbg@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-3-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627033802.1663-3-tina.zhang@intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 06:20:47 +0000 (UTC)
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
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, hang.yuan@intel.com, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6Mzg6MDBBTSArMDgwMCwgVGluYSBaaGFuZyB3cm90
ZToKPiBJbnRyb2R1Y2UgdkdQVSBzcGVjaWZpYyBpcnEgdHlwZSBWRklPX0lSUV9UWVBFX0dGWCwg
YW5kCj4gVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9JUlEgYXMgdGhlIHN1YnR5cGUgZm9y
IHZHUFUgZGlzcGxheQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdA
aW50ZWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMyArKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgvdmZpby5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+IGluZGV4IDYw
MDc4NGFjYzRhYy4uYzNlOWM4MjFhNWNiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51
eC92ZmlvLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gQEAgLTQ2NSw2ICs0
NjUsOSBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5mb19jYXBfdHlwZSB7Cj4gIAlfX3UzMiBzdWJ0eXBl
OyAgLyogdHlwZSBzcGVjaWZpYyAqLwo+ICB9Owo+ICAKPiArI2RlZmluZSBWRklPX0lSUV9UWVBF
X0dGWAkJCQkoMSkKPiArI2RlZmluZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUQkJ
KDEpCgpWRklPX0lSUV9UWVBFX0dGWF9WQkxBTksgPwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
