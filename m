Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BB2B4E7
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 14:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216B489DDF;
	Mon, 27 May 2019 12:22:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DA189DDF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 12:22:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8A1FE309265A;
 Mon, 27 May 2019 12:22:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B84B46466;
 Mon, 27 May 2019 12:22:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57F9211AAB; Mon, 27 May 2019 14:22:37 +0200 (CEST)
Date: Mon, 27 May 2019 14:22:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] vfio: ABI for setting mdev display flip eventfd
Message-ID: <20190527122237.uhd7qm62h6wfv5w7@sirius.home.kraxel.org>
References: <20190527084312.8872-1-tina.zhang@intel.com>
 <20190527084312.8872-2-tina.zhang@intel.com>
 <20190527090741.GE29553@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527090741.GE29553@zhen-hp.sh.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 27 May 2019 12:22:40 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 alex.williamson@redhat.com, zhiyuan.lv@intel.com,
 Tina Zhang <tina.zhang@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDU6MDc6NDFQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gT24gMjAxOS4wNS4yNyAxNjo0MzoxMSArMDgwMCwgVGluYSBaaGFuZyB3cm90ZToKPiA+
IEFkZCBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRGRCBpb2N0bCBjb21tYW5kIHRvIHNl
dCBldmVudGZkCj4gPiBiYXNlZCBzaWduYWxpbmcgbWVjaGFuaXNtIHRvIGRlbGl2ZXIgdkdQVSBm
cmFtZWJ1ZmZlciBwYWdlIGZsaXAKPiA+IGV2ZW50IHRvIHVzZXJzcGFjZS4KPiAKPiBTaG91bGQg
d2UgYWRkIHByb2JlIHRvIHNlZSBpZiBkcml2ZXIgY2FuIHN1cHBvcnQgZ2Z4IGZsaXAgZXZlbnQ/
CgpVc2Vyc3BhY2UgY2FuIHNpbXBseSBjYWxsIFZGSU9fREVWSUNFX1NFVF9HRlhfRkxJUF9FVkVO
VEZEIGFuZCBzZWUgaWYgaXQKd29ya2VkLiAgSWYgc28gLT4gdXNlIHRoZSBldmVudGZkLiAgT3Ro
ZXJ3aXNlIHRha2UgdGhlIGZhbGxiYWNrIHBhdGgKKHRpbWVyIGJhc2VkIHBvbGxpbmcpLiAgSSBj
YW4ndCBzZWUgYW55IGFkdmFudGFnZSBhIHNlcGFyYXRlIGZlYXR1cmUKcHJvYmUgc3RlcHMgYWRk
cy4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
