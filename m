Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35625EE4AC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Sep 2022 20:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653A610E4A5;
	Wed, 28 Sep 2022 18:57:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326610E4A5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Sep 2022 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664391415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/G4Vq697fdL4v+7M0FMtvwUHBXoZlZMDykWA34n1ZXM=;
 b=QjOiwsY7FAGk480aT0I7rnS+eZ7MhYDFLwlrkFkcuFRQQ/nn5qHEGhrbXNYQPDWukGwB7e
 V8tql7YCJJ9iaTYYYe6pra3kg5K1a7K7rei67DJnaG0K8/j1HawEm+8FJ7mujMZ+iZ3my4
 sxjk28F5QCi2MO6KfZGRCjg3GLg9Stg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-m6p__DiuMWSeBFMqhCwfXg-1; Wed, 28 Sep 2022 14:56:54 -0400
X-MC-Unique: m6p__DiuMWSeBFMqhCwfXg-1
Received: by mail-il1-f200.google.com with SMTP id
 x6-20020a056e021bc600b002f8c7ccd2c4so4102365ilv.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 28 Sep 2022 11:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=/G4Vq697fdL4v+7M0FMtvwUHBXoZlZMDykWA34n1ZXM=;
 b=ypMNxwqmTv4HMfGFq8nmcanxNZTWfbc5b5aSLeA/Y/3VRm7xl9zXCeOKk7hljJlWTb
 WP0GaXEIJSXhFwSXCmc9RfAO4sgBrOcYRAxmqz132nbAVF/ONXAkvuVFtGowyHgMoNJt
 v6oQfFxHOus+aMzDVb06JMkUP+s6ldnwhTEtOYB/H5t5aP/bp+vWpPDIBXRBVYnqgAmu
 kMCSnijPyrAvvOdrwDafS7ZVnEEkwg8fm3DI3cjvX8jGxst1jLHB0lQK7leyCYSQVI4M
 DYQrVvPtuDZG3EJUobrN+cz027lopntRoPvxkHbe7ML4dWzKa15+xWIZ1CNcZz0oh7jP
 d2ew==
X-Gm-Message-State: ACrzQf0bIN+N3honjjOzbtSgGkkBkyA89gizbnpXLzCxuN+WzEBu75x9
 mgHMjGrFl1Hqwa4Q0zw1+BgK4X5A3lM5xtJvyRpTD7lj816KUinTycq5tOHbMML01oz6neVsely
 86D1kxJqmNOPIOq/0R2mYbVy1zf1s64CzKQ==
X-Received: by 2002:a05:6e02:1a6f:b0:2f9:1b98:9412 with SMTP id
 w15-20020a056e021a6f00b002f91b989412mr225950ilv.204.1664391413859; 
 Wed, 28 Sep 2022 11:56:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+rrxfEBEydSabU2v5S3BOdqrNy/3aSdw+xUzsmxEdtmSd7NFDLxd30KRxn4ox+Ehtolvebw==
X-Received: by 2002:a05:6e02:1a6f:b0:2f9:1b98:9412 with SMTP id
 w15-20020a056e021a6f00b002f91b989412mr225931ilv.204.1664391413632; 
 Wed, 28 Sep 2022 11:56:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05663810e600b00349fb9b1abesm2084847jae.106.2022.09.28.11.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 11:56:52 -0700 (PDT)
Date: Wed, 28 Sep 2022 12:56:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v8
Message-ID: <20220928125650.0a2ea297.alex.williamson@redhat.com>
In-Reply-To: <20220928121110.GA30738@lst.de>
References: <20220923092652.100656-1-hch@lst.de>
 <20220927140737.0b4c9a54.alex.williamson@redhat.com>
 <20220927155426.23f4b8e9.alex.williamson@redhat.com>
 <20220928121110.GA30738@lst.de>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 28 Sep 2022 14:11:10 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Sep 27, 2022 at 03:54:26PM -0600, Alex Williamson wrote:
> > Oops, I had to drop this, I get a null pointer from gvt-g code:  
> 
> Ok, this is a stupid bug in the second patch in the series.  I did not
> hit it in my mdev testing as my script just uses the first type and
> thus never hits these, but as your trace showed mdevctl and once I
> used that I could reproduce it.  The fix for patch 2 is below, and
> the git tree at:
> 
>    git://git.infradead.org/users/hch/misc.git mvdev-lifetime
> 
> has been updated with that folded in and the recent reviews.

That fixes the crash, but available_instances isn't working:

[root@nuc ~]# cd /sys/class/mdev_bus/0000\:00\:02.0/mdev_supported_types/
[root@nuc mdev_supported_types]# ls */devices/
i915-GVTg_V4_1/devices/:

i915-GVTg_V4_2/devices/:

i915-GVTg_V4_4/devices/:

i915-GVTg_V4_8/devices/:
[root@nuc mdev_supported_types]# grep . */available_instances
i915-GVTg_V4_1/available_instances:1
i915-GVTg_V4_2/available_instances:2
i915-GVTg_V4_4/available_instances:5
i915-GVTg_V4_8/available_instances:7
[root@nuc mdev_supported_types]# uuidgen > i915-GVTg_V4_1/create
[root@nuc mdev_supported_types]# ls */devices/
i915-GVTg_V4_1/devices/:
669d83b1-81d8-4fd4-8d8b-7f972721c83f

i915-GVTg_V4_2/devices/:

i915-GVTg_V4_4/devices/:

i915-GVTg_V4_8/devices/:
[root@nuc mdev_supported_types]# grep . */available_instances
i915-GVTg_V4_1/available_instances:0
i915-GVTg_V4_2/available_instances:0
i915-GVTg_V4_4/available_instances:1
i915-GVTg_V4_8/available_instances:1
[root@nuc mdev_supported_types]# echo 1 > i915-GVTg_V4_1/devices/669d83b1-81d8-4fd4-8d8b-7f972721c83f/remove 
[root@nuc mdev_supported_types]# ls */devices/
i915-GVTg_V4_1/devices/:

i915-GVTg_V4_2/devices/:

i915-GVTg_V4_4/devices/:

i915-GVTg_V4_8/devices/:
[root@nuc mdev_supported_types]# grep . */available_instances
i915-GVTg_V4_1/available_instances:0
i915-GVTg_V4_2/available_instances:0
i915-GVTg_V4_4/available_instances:1
i915-GVTg_V4_8/available_instances:1

