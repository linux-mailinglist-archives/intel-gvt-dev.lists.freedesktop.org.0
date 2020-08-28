Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C802E255BE3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Aug 2020 16:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD986E446;
	Fri, 28 Aug 2020 14:04:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A686E446
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Aug 2020 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598623458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gi+o9kVZ3pRl9KJVntsAEDs9X1jzPPrVq1ZT4piLZwc=;
 b=GeHyVcx6FIATQHJEE5+s+HJ//KFZpizYyPG0o4bEd0bJwyd4SEy4sAk9ckfFQH+2ln8b1k
 1gWjoxsnVnk6i1KUmb7dgNqBKl+5tBYqS6Yq7MV5aOQIbFXB0jMMmQoxVK/hjk2hudlu8O
 2qv1uj1UslKHgKiY8ntc0L00XjBYk6s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-kphIfgFePh6Isve21yhYiw-1; Fri, 28 Aug 2020 10:04:16 -0400
X-MC-Unique: kphIfgFePh6Isve21yhYiw-1
Received: by mail-wm1-f70.google.com with SMTP id a5so418127wmj.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Aug 2020 07:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gi+o9kVZ3pRl9KJVntsAEDs9X1jzPPrVq1ZT4piLZwc=;
 b=QTkXBaqJSuTsQbJjowyVGf30IFSkbxzupPpkIeXSi8RkUMjLveRoT4AIPqxSEggH9V
 RC5I0qbh6gIWuoL4kZ7qg0EPEQDFZX/OJCMh/P+3E/IpmcTbrxYZsj9oGnPkEQJKjLcT
 S3aTm9BdNfQvdNxAswY+4O67bmco6Qc0pXcqFSSFqjAryl/0ENzqgoFInOzwtWiBaBPX
 IF+MOSbXBrRoBuBwd1faC9rXjc80CnaVABH8+IxCDx6agkAzzhwxm1wUmx8ar0FPJUHY
 NzoUqkXsHH0agwfNSYbTCISz7GbrdsIUzX8KV3k+NPfe9tYrmkj07ws4R5IuvD43wqGG
 Lb8Q==
X-Gm-Message-State: AOAM5329vxLnsFNBbHICu/ddm1fEVx8nlpGCDfeEgHhHZUwNwjUkBulh
 pEHDBKIdQ6maBzd5j9H5H7ydoEOoRjlVRIOEhB1bG5GSvtjez9KJ3p4Y2vTYob4sFP4PGUb7LVY
 qTLeQUkzxkJej0g7gLNtLcE/4IpVueRl6ug==
X-Received: by 2002:adf:ec08:: with SMTP id x8mr1578074wrn.235.1598623454918; 
 Fri, 28 Aug 2020 07:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjcEcmgw98Ndt+QARtzjoATu98n1weTlJlDzx2jKF8LfrQcWGZlMQP/bfAOjJPZD2xR/7NHA==
X-Received: by 2002:adf:ec08:: with SMTP id x8mr1578044wrn.235.1598623454652; 
 Fri, 28 Aug 2020 07:04:14 -0700 (PDT)
Received: from pop-os ([51.37.51.98])
 by smtp.gmail.com with ESMTPSA id m10sm2344213wmi.9.2020.08.28.07.04.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Aug 2020 07:04:13 -0700 (PDT)
Message-ID: <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Date: Fri, 28 Aug 2020 15:04:12 +0100
In-Reply-To: <20200828154741.30cfc1a3.cohuck@redhat.com>
References: <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
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
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 2020-08-28 at 15:47 +0200, Cornelia Huck wrote:
> On Wed, 26 Aug 2020 14:41:17 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > previously, we want to regard the two mdevs created with dsa-1dwq x 30 and
> > dsa-2dwq x 15 as compatible, because the two mdevs consist equal resources.
> > 
> > But, as it's a burden to upper layer, we agree that if this condition
> > happens, we still treat the two as incompatible.
> > 
> > To fix it, either the driver should expose dsa-1dwq only, or the target
> > dsa-2dwq needs to be destroyed and reallocated via dsa-1dwq x 30.
> 
> AFAIU, these are mdev types, aren't they? So, basically, any management
> software needs to take care to use the matching mdev type on the target
> system for device creation?

or just do the simple thing of use the same mdev type on the source and dest.
matching mdevtypes is not nessiarly trivial. we could do that but we woudl have
to do that in python rather then sql so it would be slower to do at least today.

we dont currently have the ablity to say the resouce provider must have 1 of these
set of traits. just that we must have a specific trait. this is a feature we have
disucssed a couple of times and delayed untill we really really need it but its not out
of the question that we could add it for this usecase. i suspect however we would do exact
match first and explore this later after the inital mdev migration works.

by the way i was looking at some vdpa reslated matiail today and noticed vdpa devices are nolonger
usign mdevs and and now use a vhost chardev so i guess we will need a completely seperate mechanioum
for vdpa vs mdev migration as a result. that is rather unfortunet but i guess that is life.
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
