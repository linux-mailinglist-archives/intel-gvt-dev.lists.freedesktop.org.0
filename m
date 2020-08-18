Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E429248159
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563B89C1C;
	Tue, 18 Aug 2020 09:06:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA70689C1C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597741603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7T9mpdruf8/QbUxmM0HKIFYsILTP2sJfo1DUZlpHsno=;
 b=f1bSGFXcw8iFqBoFMDZT7kmVP9X55zfYHd8+mqKOHEWCm8C3eEfIxNBs8CyS2Ft8EiduHr
 6BztyuflYYYw39yPU8//G/dUGI6SNZz0aw8plW5ADhEUep17wg/u073stFNt0SKmvzjR2w
 K14LhMSt27XVeAGXG5vG5RCBAbCebpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-vpgG3SJYObuxw_q781AWlQ-1; Tue, 18 Aug 2020 05:06:41 -0400
X-MC-Unique: vpgG3SJYObuxw_q781AWlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC45C81F02B;
 Tue, 18 Aug 2020 09:06:38 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED7F5C716;
 Tue, 18 Aug 2020 09:06:19 +0000 (UTC)
Date: Tue, 18 Aug 2020 11:06:17 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818110617.05def37c.cohuck@redhat.com>
In-Reply-To: <20200818085527.GB20215@redhat.com>
References: <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBBdWcgMjAyMCAwOTo1NToyNyArMDEwMApEYW5pZWwgUC4gQmVycmFuZ8OpIDxi
ZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6
MjQ6MzBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+IEFub3RoZXIgcG9pbnQsIGFzIHdl
IGRpc2N1c3NlZCBpbiBhbm90aGVyIHRocmVhZCwgaXQncyByZWFsbHkgaGFyZCB0byBtYWtlCj4g
PiBzdXJlIHRoZSBhYm92ZSBBUEkgd29yayBmb3IgYWxsIHR5cGVzIG9mIGRldmljZXMgYW5kIGZy
YW1ld29ya3MuIFNvIGhhdmluZyBhCj4gPiB2ZW5kb3Igc3BlY2lmaWMgQVBJIGxvb2tzIG11Y2gg
YmV0dGVyLiAgCj4gCj4gRnJvbSB0aGUgUE9WIG9mIHVzZXJzcGFjZSBtZ210IGFwcHMgZG9pbmcg
ZGV2aWNlIGNvbXBhdCBjaGVja2luZyAvIG1pZ3JhdGlvbiwKPiB3ZSBjZXJ0YWlubHkgZG8gTk9U
IHdhbnQgdG8gdXNlIGRpZmZlcmVudCB2ZW5kb3Igc3BlY2lmaWMgQVBJcy4gV2Ugd2FudCB0bwo+
IGhhdmUgYW4gQVBJIHRoYXQgY2FuIGJlIHVzZWQgLyBjb250cm9sbGVkIGluIGEgc3RhbmRhcmQg
bWFubmVyIGFjcm9zcyB2ZW5kb3JzLgoKQXMgd2UgY2VydGFpbmx5IHdpbGwgbmVlZCB0byBoYXZl
IGRpZmZlcmVudCB0aGluZ3MgdG8gY2hlY2sgZm9yCmRpZmZlcmVudCBkZXZpY2UgdHlwZXMgYW5k
IHZlbmRvciBkcml2ZXJzLCB3b3VsZCBpdCBzdGlsbCBiZSBmaW5lIHRvCmhhdmUgZGlmZmVyaW5n
IChzYXkpIGF0dHJpYnV0ZXMsIGFzIGxvbmcgYXMgdGhleSBhcmUgcHJlc2VudGVkIChhbmQgY2Fu
CmJlIGRpc2NvdmVyZWQpIGluIGEgc3RhbmRhcmRpemVkIHdheT8KCihTZWUgZS5nLiB3aGF0IEkg
Y2FtZSB1cCB3aXRoIGZvciB2ZmlvLWNjdyBpbiBhIGRpZmZlcmVudCBicmFuY2ggb2YKdGhpcyB0
aHJlYWQuKQoKRS5nLgp2ZXJzaW9uPQo8dHlwZT4udHlwZV9zcGVjaWZpY192YWx1ZTA9Cjx0eXBl
Pi50eXBlX3NwZWNpZmljX3ZhbHVlMT0KPHZlbmRvcl9kcml2ZXI+LnZlbmRvcl9kcml2ZXJfc3Bl
Y2lmaWNfdmFsdWUwPQoKd2l0aCBhIHR5cGUgb3IgdmVuZG9yIGRyaXZlciBoYXZpbmcgc29tZSBr
aW5kIG9mCmdldF9zdXBwb3J0ZWRfYXR0cmlidXRlcyBtZXRob2Q/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
