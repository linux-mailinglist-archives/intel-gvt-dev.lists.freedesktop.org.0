Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3FD100D1A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Nov 2019 21:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B436E82C;
	Mon, 18 Nov 2019 20:27:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69B46E82C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Nov 2019 20:27:24 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-j9yxDwH0O5WYMay7Sdn4Rw-1; Mon, 18 Nov 2019 15:27:22 -0500
Received: by mail-wm1-f72.google.com with SMTP id f21so651447wmh.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Nov 2019 12:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4CSRr0wqSYSaWBGreVA5UshqfJyUlItqJkHJJ7DXvXA=;
 b=ivHJrrKvym2jCkU/9BFpUCm8eYi8m4o7xaaT0psmsDHdt5pEa1hpr/HgeZUlFmwXpt
 tZHJRIPGoBK55/fym2debtavYh0Gb6ik68Ovh2ADKnLql5OQIJPMmECZBrbSMU5t0fck
 7ZVMlAUYJdQ5iGu90/bqburgllLHB4M5WNqTm1xvR8HIPUj7QGTkd3AEYuQPBTQCBlUg
 h0U0z7XgM7cFDO4HMdQLAl3Va+lIb/Me8Pn56U5a+KToBFoCsKbULPo4JXI3j9hY5be2
 5PJPbl+8a1YMS951LzZUAMEXPQ1kmLJM97UKoRUJ7XMr5Dv+LD+B+wwKJ5HdfNPcXnJt
 xBqQ==
X-Gm-Message-State: APjAAAWyfix6cQFOJsreOyrBuURSy799+RDGG8FusW+/ro0YXX+KVVgs
 HPGhvhpgxRqBQ8KEyN/e15SU0QCbyhgi/Ew/gYk77m/LK2csGgRx2nEV99fyTe8m3WnwzOPGlm9
 Mc+z4dfM1JWgf0NW+BSkZtoddvXrqCPQFoQ==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr19881071wrq.301.1574108841332; 
 Mon, 18 Nov 2019 12:27:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw31yFDrp/nUVQehJkoIE0NmJKGe+zacK1mZHaf8dckH0iFWZ5NwNGMNlo/b/EQ1sdZlgIyIA==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr19881034wrq.301.1574108841171; 
 Mon, 18 Nov 2019 12:27:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id l10sm27849030wrg.90.2019.11.18.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:27:20 -0800 (PST)
Date: Mon, 18 Nov 2019 15:27:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
Message-ID: <20191118152642-mutt-send-email-mst@kernel.org>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191118134056.GJ3873@mellanox.com>
X-MC-Unique: j9yxDwH0O5WYMay7Sdn4Rw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574108843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrzR/CZ37kLKu+aMpz2wgHs5trU1arLDMcmgOmdvzKE=;
 b=LQiLhsRnShWkfJ3gF6IA4MPCTexT5IzhcgC7S2IQxZ5y3uYt4qHelqYYA9QoRNQqzDN6Ib
 GaokqqwBNdUufS+hMIjwgvTSA5I5UlfhcKVjVhjr+rPTZi+XQeDP/NBvkRfeC1xhgplM7K
 iokyND9h2mIZ5LULEPiyx687T4+4PFY=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>, "airlied@linux.ie" <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDE6NDE6MDBQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDA2OjU5OjIxUE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiArc3RydWN0IGJ1c190eXBlIG1kZXZfdmlydGlvX2J1c190eXBlOwo+
ID4gKwo+ID4gK3N0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Ugewo+ID4gKwlzdHJ1Y3QgbWRldl9k
ZXZpY2UgbWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IG1kZXZfdmlydGlvX29wcyAqb3BzOwo+ID4g
Kwl1MTYgY2xhc3NfaWQ7Cj4gPiArfTsKPiAKPiBUaGlzIHNlZW1zIHRvIHNoYXJlIG5vdGhpbmcg
d2l0aCBtZGV2IChpZSBtZGV2LXZmaW8pLCB3aHkgaXMgaXQgb24gdGhlCj4gc2FtZSBidXM/CgpJ
IG11c3QgYmUgbWlzc2luZyBzb21ldGhpbmcgLSB3aGljaCBidXMgZG8gdGhleSBzaGFyZT8KCi0t
IApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
