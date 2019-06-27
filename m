Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C057BD8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 08:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D416E5AD;
	Thu, 27 Jun 2019 06:19:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D7E6E5AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 06:19:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8751519CB81;
 Thu, 27 Jun 2019 06:19:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02C9760856;
 Thu, 27 Jun 2019 06:19:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8730911AAF; Thu, 27 Jun 2019 08:19:42 +0200 (CEST)
Date: Thu, 27 Jun 2019 08:19:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Message-ID: <20190627061942.k5onxbm27dju3iv5@sirius.home.kraxel.org>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-2-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627033802.1663-2-tina.zhang@intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 06:19:47 +0000 (UTC)
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

ICBIaSwKCj4gK3N0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsKPiArCXN0cnVjdCB2Zmlv
X2luZm9fY2FwX2hlYWRlciBoZWFkZXI7Cj4gKwlfX3UzMiB0eXBlOyAgICAgLyogZ2xvYmFsIHBl
ciBidXMgZHJpdmVyICovCj4gKwlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZpYyAqLwoK
RG8gd2UgcmVhbGx5IG5lZWQgYm90aCB0eXBlIGFuZCBzdWJ0eXBlPwoKY2hlZXJzLAogIEdlcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
